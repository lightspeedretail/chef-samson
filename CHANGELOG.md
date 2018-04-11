samson
======

v1.0.1
------
* PLUGINS should be a Comma Separated Value now

v1.0.0
------
* Default to ruby 2.5.0 and samson v2207

v0.4.0
------
* Added ENV vars required for later versions of Samson

v0.3.0
------
* DO-2005 Added support for custom configs in the .env file
* Fixed potential bad template rendition bug for base configs items
* Moved the asset precompiling to after_build to allow for the creation of config files to handle plugins
* Made the asset precompiling be triggered by the env template to allow for plugin changes to take effect

v0.2.0
------
* DO-1981 Made the database template's output sensitive to hide the DB credentials
* DO-1981 Added a default value for the secret_storage_backend since a blank parameter prevents the app from starting
* DO-1981 Added the memcache_servers config parameters to use a non-local memcache service
* DO-1981 Made the home of the samson user different from the samson root folder to facilitate deploying under other users

v0.1.1
------
* DO-1929 Made the install of both rbenv and the samson-specific version of ruby happen at the user level

v0.1.0
------
* Initial development
