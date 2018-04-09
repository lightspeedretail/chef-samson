default['rbenv']['user_installs'] = [
  { 'user'    => node['samson']['user'],
    'home'    => node['samson']['home_dir'],
    'rubies'  => [node['samson']['ruby']['version']],
    'global'  => node['samson']['ruby']['version'],
    'gems'    => {
      node['samson']['ruby']['version'] => [
        { 'name'    => 'bundler' }
      ]
    }
  }
]
