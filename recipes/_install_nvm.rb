include_recipe 'nvm'

nvm_install node['samson']['node']['version'] do
  from_source false
  action :create
end
