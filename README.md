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

### install plugin
- vagrant plugin install vagrant-omnibus

### Start vagrant
- vagrant up

## Roles

### base.json
- supervisor (http://<address>:9001/)

### controller.json
- jenkins (http://<address>:8180/)
- chef-server (https://<address>/)

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

## Remarks
- which vagrant should be /usr/bin/vagrant
