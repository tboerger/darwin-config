{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.iterm;

in

{
  options = with lib; {
    my = {
      modules = {
        iterm = {
          enable = mkEnableOption ''
            Whether to enable iterm module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "iterm2"
        ];
      };
    };
}
