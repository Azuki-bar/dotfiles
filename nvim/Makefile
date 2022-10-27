all: build run
.PHONY:build
build:
	docker build --tag neovim-checker .
run: 
	docker run --rm -ti neovim-checker bash
