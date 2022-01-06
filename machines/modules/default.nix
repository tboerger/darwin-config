{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix

    ./shells.nix
    ./nix.nix
    ./fonts.nix
    ./tools.nix
    ./kube.nix
  ];

  my = {
    modules = {
      shells = {
        enable = true;
      };

      nix = {
        enable = true;
      };

      fonts = {
        enable = true;
      };

      tools = {
        enable = true;
      };

      kube = {
        enable = true;
      };
    };
  };
}
