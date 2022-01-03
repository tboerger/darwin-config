{
  description = "Nix and HomeManager configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";
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

  outputs = { self, nixpkgs, agenix, darwin, hm }:
  let
    configuration = { pkgs, ... }: {
      nixpkgs = {
        config = {
          allowUnfree = true;
        };
      };

      nix = {
        package = pkgs.nixFlakes;
      };

      services = {
        nix-daemon = {
          enable = true;
        };
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };
  in
  {
    overlays = [
      (import ./overlays)
    ];

    darwinConfigurations.osiris = darwin.lib.darwinSystem {
      system = "x86_64-darwin";

      modules = [
        agenix.nixosModules.age
        hm.nixosModules.home-manager

        configuration

        ./machines/darwin/osiris
        ./profiles/darwin/thomas
      ];

      inputs = { inherit nixpkgs darwin agenix hm; };
    };
  };
}
