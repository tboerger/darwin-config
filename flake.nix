{
  description = "Darwin configurations by tboerger";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    utils = {
      url = "github:numtide/flake-utils";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homemanager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, utils, agenix, homemanager, darwin, ... }@inputs:
    let
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
            (import ./overlays)
            nur.overlay
          ];
        };
      };
    in
    {
      darwinConfigurations = {
        osiris = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            homemanager.darwinModules.home-manager
            agenix.nixosModules.age
            sharedDarwinConfiguration
            ./machines/osiris
            ./profiles/thomas
          ];

          specialArgs = {
            inherit inputs;
          };
        };
        hathor = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            homemanager.darwinModules.home-manager
            agenix.nixosModules.age
            sharedDarwinConfiguration
            ./machines/hathor
            ./profiles/thomas
          ];

          specialArgs = {
            inherit inputs;
          };
        };
        anubis = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            homemanager.darwinModules.home-manager
            agenix.nixosModules.age
            sharedDarwinConfiguration
            ./machines/anubis
            ./profiles/thomas
          ];

          specialArgs = {
            inherit inputs;
          };
        };
      };

      osiris = self.darwinConfigurations.osiris.system;
      hathor = self.darwinConfigurations.hathor.system;
      anubis = self.darwinConfigurations.anubis.system;
    } // utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            agenix.defaultPackage.${system}
            nixpkgs-fmt
            gnumake
            nixUnstable
          ];
        };
      }
    );
}
