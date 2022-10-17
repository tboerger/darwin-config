{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./fonts.nix
    ./homebrew.nix
    ./nix.nix
    ./shells.nix
    ./sudoers.nix
    ./tools.nix
  ];

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
