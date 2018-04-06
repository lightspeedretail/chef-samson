group node['samson']['group'] do
  only_if { node['samson']['manage_user'] }
end

user node['samson']['user'] do
  group   node['samson']['group']
  home    node['samson']['home_dir']
  shell   '/bin/false'
  comment 'Samson service account'
  password nil
  supports manage_home: false
  only_if { node['samson']['manage_user'] }
end

directory 'samson home_dir' do
  owner node['samson']['user']
  group node['samson']['group']
  path node['samson']['home_dir']
  recursive true
  not_if do
    ::File.directory?(node['samson']['home_dir'])
  end
end

# Optionaly create the root directory for situations where the parent
# directories have not yet been created. For situations where we may want to
# deploy into an existing directory, ignore this step.
#
directory 'samson root_dir' do
  owner node['samson']['user']
  group node['samson']['group']
  path node['samson']['root_dir']
  recursive true
  not_if do
    ::File.directory?(node['samson']['root_dir'])
  end
end


