configuration
=============

Virtual machine for development
## Installation

### Vagrant
- Download and install [Vagrant](http://downloads.vagrantup.com/)
- Install vagrant plugins
- vagrant plugin install vagrant-vbguest

### VirtualBox
- Download and install [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)

### NFS
- sudo apt-get install nfs-kernel-server

### librarian-chef
- sudo gem install librarian-chef

### Download cookbooks
- librarian-chef install

### Start vagrant
- vagrant up

## Roles

### base.json
- supervisor (http://<address>:9001/)

### db.json
- memcached
- mongodb
- postgresql
- rabbitmq
- redis

### db-monitoring
- postgresql admin (http://<address>:4000/)
- rabbitmq management (http://<address>:15672/)
- monit (http://<address>:2812/)
