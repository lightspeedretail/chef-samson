include_recipe 'ruby_rbenv::default'
include_recipe 'ruby_build::default'

include_recipe 'ruby_rbenv::user'

rbenv_gem 'bundle' do
  rbenv_version node['samson']['ruby']['version']
  user node['samson']['user']
end
