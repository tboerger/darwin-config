{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.multipass;

in

{
  options = {
    profile = {
      programs = {
        multipass = {
          enable = mkEnableOption "Multipass" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "multipass"
      ];
    };
  };
}
