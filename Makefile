SHELL := bash

.PHONY: update
update:
	nix --extra-experimental-features "nix-command flakes" flake update

.PHONY: switch
switch:
	NIXPKGS_ALLOW_UNFREE=1 darwin-rebuild switch --impure --flake .
