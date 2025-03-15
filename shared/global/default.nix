{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  imports = [
    ./fonts.nix
    ./macos.nix
    ./nixpkgs.nix
    ./sudoers.nix
    ./time.nix
  ];

  config = {
    home-manager = {
      backupFileExtension = "backup";
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
