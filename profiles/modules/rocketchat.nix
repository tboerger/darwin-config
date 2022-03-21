{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.rocketchat;

in

{
  options = with lib; {
    my = {
      modules = {
        rocketchat = {
          enable = mkEnableOption ''
            Whether to enable rocketchat module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "rocket-chat"
        ];
      };
    };
}
