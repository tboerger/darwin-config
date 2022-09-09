{
  description = "NixOS and Darwin configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";
    };

    unstable = {
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

    homemanager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nur, ... }@inputs:
    let
      overlay-unstable = final: prev: {
        unstable = inputs.unstable.legacyPackages.${prev.system};
      };

      sharedDarwinConfiguration = { config, pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;

          extraOptions = ''
            experimental-features = nix-command flakes
          '';

          settings = {
            substituters = [
              "https://cache.nixos.org"
              "https://nix-community.cachix.org"
              "https://nixpkgs.cachix.org"
              "https://tboerger.cachix.org"
            ];

            trusted-public-keys = [
              "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
              "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
              "tboerger.cachix.org-1:3Q1gyqgA9NsOshOgknDvc6fhA8gw0PFAf2qs5vJpeLU="
            ];
          };
        };

        nixpkgs = {
          config = {
            allowUnfree = true;
          };

          overlays = [
            self.overlay
            nur.overlay
            overlay-unstable
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
            inputs.homemanager.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            sharedDarwinConfiguration
            ./machines/osiris
            ./profiles/thomas
            # ./profiles/anna
            # ./profiles/adrian
            # ./profiles/tabea
          ];
        };
        hathor = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.homemanager.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            sharedDarwinConfiguration
            ./machines/hathor
            ./profiles/thomas
            # ./profiles/anna
            # ./profiles/adrian
            # ./profiles/tabea
          ];
        };
        anubis = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.homemanager.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            sharedDarwinConfiguration
            ./machines/anubis
            ./profiles/thomas
            # ./profiles/anna
            # ./profiles/adrian
            # ./profiles/tabea
          ];
        };
      };

      osiris = self.darwinConfigurations.osiris.system;
      hathor = self.darwinConfigurations.hathor.system;
      anubis = self.darwinConfigurations.anubis.system;
    };
}
