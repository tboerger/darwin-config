{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  imports = [
    ./dock.nix
    ./finder.nix
  ];

  options = with lib; {
    profile = {
      username = mkOption {
        type = types.str;
      };

      programs = { };
    };
  };
}
