{
  description = "NixOS and Darwin configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      sharedConfig = { config, pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;

          extraOptions = ''
            experimental-features = nix-command flakes
          '';

          binaryCaches = [
            "https://cache.nixos.org"
            "https://nix-community.cachix.org"
            "https://nixpkgs.cachix.org"
            "https://tboerger.cachix.org"
          ];

          binaryCachePublicKeys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
            "tboerger.cachix.org-1:3Q1gyqgA9NsOshOgknDvc6fhA8gw0PFAf2qs5vJpeLU="
          ];

          gc = {
            automatic = true;
            persistent = true;
            dates = "weekly";
            options = "--delete-older-than 2w";
          };
        };

        nixpkgs = {
          config = {
            allowUnfree = true;
          };

          overlays = [
            self.overlay
            inputs.nur.overlay
          ];
        };
      };
    in
    {
      overlay = import ./overlays;

      darwinConfigurations = {
        osiris = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.hm.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            ./machines/shared
            ./machines/darwin
            sharedConfig
            ./machines/osiris
            ./profiles/thomas
            ./profiles/anna
            ./profiles/adrian
            ./profiles/tabea
          ];
        };
        hathor = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.hm.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            ./machines/shared
            ./machines/darwin
            sharedConfig
            ./machines/hathor
            ./profiles/thomas
            ./profiles/anna
            ./profiles/adrian
            ./profiles/tabea
          ];
        };
        anubis = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.hm.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            ./machines/shared
            ./machines/darwin
            sharedConfig
            ./machines/anubis
            ./profiles/thomas
            ./profiles/anna
            ./profiles/adrian
            ./profiles/tabea
          ];
        };
      };

      nixosConfigurations = {
        chnum = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };

          modules = [
            inputs.hm.nixosModules.home-manager
            inputs.agenix.nixosModules.age
            ./modules/shared
            ./modules/nixos
            sharedConfig
            ./machines/chnum
            ./profiles/thomas
          ];
        };
      };
    };
}
