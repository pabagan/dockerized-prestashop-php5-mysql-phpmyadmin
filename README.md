# Docker Prestashop with php:5.6-apache, MySQL and PhpMyAdmin

Create Docker development environment for PrestaShop with local persisting DB and APP files.

Also separates mysql from Prestashop images, yes!

Built using Oficial images:
* [Prestashop PHP](https://hub.docker.com/r/prestashop/prestashop/).
* [MySQL](https://hub.docker.com/_/mysql/).
* [PhpMyAdmin](https://hub.docker.com/r/phpmyadmin/phpmyadmin/).



## Build

### 1. Set environment variables
* Rename `.env-demo` to `.env` and set environment variables.

```bash
# APP Name
# Is also used to set the persistent 
# APP directori. Look at docker-compose.
APP_NAME=prestashop

# Set persistent directory for 
# mysql.
PERSISTENT_DB=./mysql

# mysql
MYSQL_HOST=mysql
MYSQL_ROOT_PASSWORD=pwd
MYSQL_DATABASE=db
MYSQL_USER=user
MYSQL_PASSWORD=secret
```

### 2. Set PrestaShop

```bash
# Get the prestashop zip
./prestashop-install.sh
```

It creates a `/prestashop` folder and change permissions to be used by the server. 

#### Change/recover permissions:

```bash
# give server permissions to PS
sudo chown -R www-data:www-data prestashop/
# find a bash doing that
./.sh/permission-server.sh

# recover pemision back to user
sudo chown -R $USER:$USER prestashop/
# or
./.sh/permission-user.sh
```


(*) if changed APP_NAME before remember rename `/prestashop`  to `/APP_NAME`.


### 3. Run Docker
Run `docker-compose up` (needs [Docker Compose](https://docs.docker.com/compose/) installed) to build and run the system.
* PrestaShop at [http://0.0.0.0:8080/](http://0.0.0.0:8080/).
* PhpMyAdmin at [http://0.0.0.0:8888/](http://0.0.0.0:8888/).


## All in

```bash
# clone
git clone git@github.com:pabagan/dockerized-prestashop-php5-mysql-phpmyadmin.git prestashop

# remember! change .env-dem to .env 

# enter folder
cd prestashop

# run install prestashop command
./install-prestashop.sh

# build and run docker
docker-compose up
```

## Requirements
* [Docker Machine](https://docs.docker.com/machine/) (Mac and Windows).
* [Docker Engine](https://docs.docker.com/installation/).
* [Docker Compose](https://docs.docker.com/compose/).

# Repo

* [Docker Prestashop with php:5.6-apache, MySQL and PhpMyAdmin](https://github.com/pabagan/dockerized-prestashop-php5-mysql-phpmyadmin).