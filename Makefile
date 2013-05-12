all:
	@git submodule init && git submodule update
	vagrant up
