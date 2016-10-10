default['rbenv']['user_installs'] = [
  { 'user'    => node['samson']['user'],
    'home'    => node['samson']['root_dir'],
    'rubies'  => [node['samson']['ruby']['version']]
  }
]
