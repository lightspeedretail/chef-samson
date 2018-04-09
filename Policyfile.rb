name 'samson'
default_source :supermarket
run_list 'samson::default'
cookbook 'samson', path: '.'
cookbook 'common_deploy',
  git: 'git@github.com:lightspeedretail/chef-common_deploy.git',
  tag: 'v0.2.0'
