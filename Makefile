install:
	#@git submodule init && git submodule update
	#vagrant plugin install vagrant-cachier
	librarian-chef install
	rm -rf cookbooks/homebrew

update:
	librarian-chef update
