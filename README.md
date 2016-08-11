# Samson Cookbook

The Samson cookbook provides resources to install [Zendesk Samson](https://github.com/zendesk/samson).

## Requirements

- Chef 12.7.0 or higher

#### Platform

- Debian, Ubuntu with Upstart

## Cookbook Dependencies

- common_deploy
- nvm
- ruby\_rbenv
- ruby\_build

## Usage

Place a dependency on the samsin cookbook in your cookbook's metadata.rb

```ruby
depends 'samson'
```

Then, in a recipe:

```ruby
include_recipe 'samson::default'
```

## Attributes

Generic _samson_ configuration parameters:
- `node['samson']['user']` - The user account which owns and runs the _samson_ service.
- `node['samson']['group']` - The group account which owns and runs the _samson_ service.
- `node['samson']['manage_user']` - Whether to create the user/group if not found. This may be disabled when the users are created elsewhere.

- `node['samson']['root_dir']` - Root directory into which Samson will be deployed in an atomic manner.
- `node['samson']['service']['name']` - Name fo the samson service.

- `node['samson']['ruby']['version']` - Ruby version installed via rbenv
- `node['samson']['node']['version']` - Nodejs version installed via nvm

Deployment specific _samson_ configuration parameters:
- `node['common_deploy']['samson']['revision']['scm']['repository']` - Git repository containing the _samson_ sourc ecode.
- `node['common_deploy']['samson']['revision']['scm']['revision']` - Git tag, branch or revision to deploy.

Rails specific _samson_ parameters:
- `node['common_deploy']['samson']['configuration']['environment']` - The rails environment to set.

Database specific _samson_ parameters:
- `node['common_deploy']['samson']['database']['adapter']` - The database adapter, may be mysql2, sqlite3, postgresql.
- `node['common_deploy']['samson']['database']['username']` - The database username if required.
- `node['common_deploy']['samson']['database']['password']` - The database password if required.
- `node['common_deploy']['samson']['database']['path']` - The path to the databse file (sqlite3) or the name of the database.

Plugin specific _samson_ parameters:
- `node['common_deploy']['samson']['plugins']` - Array of plugins to enable. Defaults to [all] to enable all plugins.
- `node['common_deploy']['samson'][PLUGIN_NAME]` - Hash of configuration parameters specific to individual plugins.

