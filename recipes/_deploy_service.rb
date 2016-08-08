app_config = CommonApps['samson']['configuration']

template '/etc/init/samson.conf' do
  source 'service/upstart.conf.erb'
  variables user: node['samson']['user'],
            group: node['samson']['group'],
            cwd: "#{node['samson']['root_dir']}/current",
            environment: app_config['environment'],
            name: 'samson'
end

service 'samson' do
  supports restart: true
  action :start
  only_if do
    ::File.exist?("#{node['samson']['root_dir']}/current")
  end
end
