# User/Group which both owns the Samson files and is assumed when running the
# _samson_ service.
default['samson']['user'] = 'samson'
default['samson']['group'] = 'samson'
default['samson']['home_dir'] = '/var/www'

# Whether to create the user and group.
default['samson']['manage_user'] = true

# Root directory under which Samson is deployed in an atomic manner.
default['samson']['root_dir'] = File.join(node['samson']['home_dir'], 'samson')

# Name of the _samson_ service resource.
default['samson']['service']['name'] = 'service[samson]'

# Version of ruby managed by rbenv.
default['samson']['ruby']['version'] = '2.3.1'

# Version of node managed by nvm.
default['samson']['node']['version'] = '6.1.0'
