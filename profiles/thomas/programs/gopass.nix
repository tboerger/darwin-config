{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.gopass;

in
{
  options = {
    profile = {
      programs = {
        gopass = {
          enable = mkEnableOption "Gopass" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        gopass
      ];
    };

    xdg = {
      configFile = {
        "gopass/config" = {
          text = ''
            [core]
                notifications = true
                exportkeys = true
                autoimport = true
                cliptimeout = 45
                autoclip = false
                showsafecontent = false
                parsing = true
                nopager = false

            [age]
                usekeychain = false

            [mounts]
                path = ${config.xdg.dataHome}/gopass/stores/root

            [mounts "cloudpunks"]
                path = ${config.xdg.dataHome}/gopass/stores/cloudpunks

            [mounts "gopad"]
                path = ${config.xdg.dataHome}/gopass/stores/gopad
            [mounts "kleister"]
                path = ${config.xdg.dataHome}/gopass/stores/kleister
          '';
        };
      };
    };
  };
}
