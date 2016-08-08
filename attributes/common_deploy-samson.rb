default['common_deploy']['samson']['revision'].tap do |config|
  config['scm']['repository'] = 'https://github.com/zendesk/samson.git'
  config['scm']['revision'] = 'v825'
end

default['common_deploy']['samson']['configuration'].tap do |config|
  config['environment'] = 'production'
  config['default_url'] = 'http://localhost:3000'
  config['secret_token'] = 'secret'
  config['plugins'] = %w(all)

  config['database']['adapter'] = 'sqlite3'
  config['database']['path'] = 'db/samson'
end
