{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.act;

in
{
  options = {
    profile = {
      programs = {
        act = {
          enable = mkEnableOption "Act";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        act
      ];
    };

    home = {
      file = {
        ".actrc" = {
          text = ''
            -P ubuntu-latest=catthehacker/ubuntu:act-latest
            -P ubuntu-22.04=catthehacker/ubuntu:act-22.04
            -P ubuntu-20.04=catthehacker/ubuntu:act-20.04
            -P ubuntu-18.04=catthehacker/ubuntu:act-18.04
          '';
        };
      };
    };
  };
}
