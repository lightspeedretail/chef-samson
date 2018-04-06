name             'samson'
maintainer       'Omni Devops'
maintainer_email 'pg.omni.devops@lightspeedhq.com'
license          'Apache 2.0'
description      'Installs/Configures samson'
long_description 'Installs/Configures samson'
version          '1.0.0'
chef_version     '~> 12.7.2'

source_url       'https://github.com/lightspeedretail/chef-samson'
issues_url       File.join(source_url, 'issues')

supports 'ubuntu 14'

depends 'common_deploy',  '~> 0.2.0'
depends 'nvm',            '~> 0.1.7'
depends 'ruby_rbenv',     '~> 1.1.0'
depends 'ruby_build',     '~> 1.1.0'
