SHELL := bash
UNAME := $(shell uname -s)

.PHONY: update
update:
	nix --extra-experimental-features "nix-command flakes" flake update

.PHONY: switch
switch:
ifeq ($(UNAME),Linux)
	sudo nixos-rebuild switch
endif
ifeq ($(UNAME),Darwin)
	sudo darwin-rebuild switch
endif
