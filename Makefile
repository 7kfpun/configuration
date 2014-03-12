install:
	#@git submodule init && git submodule update
	#vagrant plugin install vagrant-cachier
	librarian-chef install

update:
	librarian-chef update
