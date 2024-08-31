{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./fonts.nix
    ./homebrew.nix
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
