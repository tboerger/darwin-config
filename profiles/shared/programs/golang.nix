{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

let
  cfg = config.profile.programs.golang;

in
{
  options = {
    profile = {
      programs = {
        golang = {
          enable = mkEnableOption "Golang";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      sessionPath = [ "$HOME/Golang/bin" ];
    };

    programs = {
      go = {
        enable = true;
        package = pkgs.go;

        env = {
          GOBIN = "${config.home.homeDirectory}/Golang/bin";
          GOPATH = "${config.home.homeDirectory}/Golang";
        };
      };
    };
  };
}
