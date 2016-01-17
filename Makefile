CRLIBPATH := $(shell crenv prefix)/embedded/lib
CRFLAGS   := --link-flags "-static -L$(CRLIBPATH)"

.PHONY: default all deps build release test clean

default: all
all:

deps:
	shards install

build:
	mkdir -p bin
	crystal build src/app.cr -o ./bin/slack-invite

release:
	mkdir -p bin
	crystal build src/app.cr -o ./bin/slack-invite $(CRFLAGS)

test:
	crystal spec

clean:
	rm -rf .crystal
	rm -rf .shards
	rm -rf libs
	rm -rf bin

deploy:
	sed -i '/\/bin/d' .gitignore
	git add .gitignore bin/
	git commit -m 'chore(release): release build by circleci'
	git push -f ssh://569ab9917628e1eb9b000110@crystal-pinemz2.rhcloud.com/~/git/crystal.git/ master
