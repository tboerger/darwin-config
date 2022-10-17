{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.lastpass;

in

{
  options = {
    profile = {
      programs = {
        lastpass = {
          enable = mkEnableOption "Lastpass" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "lastpass"
      ];
    };
  };
}
