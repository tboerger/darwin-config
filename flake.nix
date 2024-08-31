{
  description = "Darwin configurations by tboerger";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    utils = {
      url = "github:numtide/flake-utils";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homemanager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, utils, nur, devshell, homemanager, agenix, darwin, ... }@inputs:
    let
      inherit (self) outputs;

      sharedConfiguration = { config, pkgs, ... }: {
        nix = {
          package = pkgs.nixVersions.stable;

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
            (import ./overlays)
          ];
        };
      };

      mkComputer = configurationNix: systemName: extraModules: darwin.lib.darwinSystem {
        system = systemName;

        modules = [
          sharedConfiguration
          homemanager.darwinModules.home-manager
          agenix.nixosModules.default
          configurationNix
        ] ++ extraModules;

        specialArgs = {
          inherit inputs;
        };
      };
    in
    {
      darwinConfigurations = {
        dagda = mkComputer
          ./machines/dagda
          "aarch64-darwin"
          [
            ./profiles/thomas/user.nix

            {
              home-manager = {
                users = {
                  thomas = {
                    imports = [
                      agenix.homeManagerModules.default
                      ./profiles/thomas
                    ];
                  };
                };
              };
            }
          ];
      };

      dagda = self.darwinConfigurations.dagda.system;
    } // utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ devshell.overlays.default ];
          };

        in
        {
          devShells.default = pkgs.devshell.mkShell {
            commands = [
              {
                name = "age-encrypt";
                category = "secrets commands";
                help = "Encrypt secret with age";
                command = "${pkgs.rage}/bin/rage -e -a -i ~/.ssh/id_ed25519";
              }
              {
                name = "age-decrypt";
                category = "secrets commands";
                help = "Decrypt secret with age";
                command = "${pkgs.rage}/bin/rage -d -i ~/.ssh/id_ed25519";
              }

              {
                package = "nixpkgs-fmt";
                category = "formatter commands";
              }
            ];

            packages = with pkgs; [
              inputs.agenix.packages.${system}.default

              git
              gnumake
              home-manager
              nixpkgs-fmt
              rage
            ];
          };
        }
      );
}
