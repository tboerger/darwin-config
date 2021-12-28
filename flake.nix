{
  description = "NixOS and HomeManager configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    utils = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nur, utils, agenix, home-manager }:
    utils.lib.mkFlake {
      inherit self inputs;
      overlay = import ./overlays;

      channelsConfig = {
        allowUnfree = true;
      };

      sharedOverlays = [
        nur.overlay
        self.overlay
      ];

      hostDefaults = {
        modules = [
          agenix.nixosModules.age
          home-manager.nixosModules.home-manager
          ./modules
        ];
      };

      hosts = {
        chnum = {
          modules = [
            ./machines/chnum.nix
            ./profiles/thomas.nix
          ];
        };
      };
    };
}
