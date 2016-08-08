include_recipe 'ruby_rbenv::default'
include_recipe 'ruby_rbenv::system_install'
include_recipe 'ruby_build::default'

rbenv_ruby node['samson']['ruby']['version'] do
  user node['samson']['user']
end

rbenv_gem 'bundle' do
  rbenv_version node['samson']['ruby']['version']
  user node['samson']['user']
end
