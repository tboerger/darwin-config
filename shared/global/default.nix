{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./sudoers.nix
    ./time.nix
  ];

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
