init:
	gem update --system 
	gem install bundler
	gem install librarian-chef
	bundle install

install:
	librarian-chef install

update:
	librarian-chef update
