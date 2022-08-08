{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.oneclipboard;

in

{
  options = with lib; {
    my = {
      modules = {
        oneclipboard = {
          enable = mkEnableOption ''
            Whether to enable oneclipboard module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "1clipboard"
        ];
      };
    };
}
