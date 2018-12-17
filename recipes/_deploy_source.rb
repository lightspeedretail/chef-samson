# Prepare application variables
#
app_config 	= CommonApps['samson']['configuration']
repo_config = CommonApps['samson']['revision']

# Deploy the code
#
common_deploy_revision node['samson']['root_dir'] do
  user node['samson']['user']
  group node['samson']['group']

  environment 'RACK_ENV' => app_config['environment'],
              'RAILS_ENV' => app_config['environment'],
              'PATH' => [
                "#{node['samson']['root_dir']}/rbenv/bin",
                "/usr/local/src/nvm/versions/node/v6.1.0/bin",
                ENV['PATH']
              ].join(':')

  repository repo_config['scm']['repository']
  revision repo_config['scm']['revision']

  purge_on_build %w(log)
  create_on_build %w(vendor/gems)
  symlink_on_build 'log' => 'log'

  support_force repo_config['build']['support_force']
  support_migrate repo_config['build']['support_migrate']
  support_publish repo_config['build']['support_publish']

  after_cache do
    disabled_gem_groups = %w(postgres sqlite mysql2)

    case app_config['database']['adapter']
    when 'sqlite3' then disabled_gem_groups.delete('sqlite')
    else disabled_gem_groups.delete(app_config['database']['adapter'])
    end

    rbenv_script 'bundle install' do
      code %w(
        bundle
        --without
      ).concat(disabled_gem_groups).join(' ')
      cwd release_path
      rbenv_version node['samson']['ruby']['version']
      environment new_resource.environment
      user new_resource.user
    end

  end

  before_build do
    %w(log).each do |path|
      directory shared_name(path) do
        path  shared_path(path)
        owner new_resource.user
        group new_resource.group
        mode  02755
        recursive true
      end
    end
  end

  after_build do
    release_template 'config/database.yml' do
      sensitive true
      variables app_config.to_hash['database'].merge(
                  'environment' => app_config['environment']
                )
      notifies :restart, 'service[samson]', :delayed
    end

    release_template '.env' do
      source 'env.erb'
      sensitive true
      variables app_config.to_hash
      notifies :restart, 'service[samson]', :delayed
      notifies :run, 'rbenv_script[rake assets:precompile]', :immediately
    end

    rbenv_script 'rake assets:precompile' do
      code %(RAILS_ENV=production PRECOMPILE=1 rake assets:precompile assets:clean[0])
      cwd release_path
      rbenv_version node['samson']['ruby']['version']
      environment new_resource.environment
      user new_resource.user
      action :nothing
    end

    release_template shared_name('config/puma.rb') do
      path release_path('config/puma.rb')
      variables app_config.to_hash['puma']
      notifies :restart, 'service[samson]', :delayed
    end
  end

  after_publish do
    ruby_block 'notify services' do
      block do
      end
      notifies :restart, 'service[samson]', :delayed
    end
  end

  migrate_action do
    rbenv_script 'rake db:migrate' do
      code %(rake db:migrate)
      cwd release_path
      rbenv_version node['samson']['ruby']['version']
      environment new_resource.environment
      user new_resource.user
    end
  end
end

application = resources(common_deploy_revision: node['samson']['root_dir'])

template '/etc/init/samson.conf' do
  source 'service/upstart.conf.erb'
  variables user: application.user,
            group: application.group,
            cwd: application.current_path,
            environment: app_config['environment'],
            name: 'samson'
  notifies :restart, 'service[samson]', :delayed
end

service 'samson' do
  action :start
  only_if do
    ::File.exist?(application.current_path)
  end
end
