include_recipe 'ruby_rbenv::default'
include_recipe 'ruby_build::default'

node.default['rbenv']['user_installs'] = [
  { 'user'    => node['samson']['user'],
    'home'    => node['samson']['root_dir'],
    'rubies'  => [node['samson']['ruby']['version']]
  }
]

include_recipe 'ruby_rbenv::user'

rbenv_gem 'bundle' do
  rbenv_version node['samson']['ruby']['version']
  user node['samson']['user']
end
