app_config = CommonApps['samson']['configuration']
packages = []

case app_config['database']['adapter']
when 'mysql2'
  packages = value_for_platform_family(
    %w(default) => %w(mysql-client-5.5 libmysqlclient-dev)
  )
when 'postgresql'
  packages = value_for_platform_family(
    %w(default) => %w(libqg-dev)
  )
end

packages.each do |name|
  package name
end
