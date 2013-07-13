all:
	@git submodule init && git submodule update
	vagrant plugin install vagrant-cachier
	vagrant up
