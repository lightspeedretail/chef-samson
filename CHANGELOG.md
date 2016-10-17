samson
======

v0.3.0
------
* DO-2005 Added support for custom configs in the .env file
* Fixed potential bad template rendition bug for base configs items

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
