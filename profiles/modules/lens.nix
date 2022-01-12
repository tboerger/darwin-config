{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.lens;

in

{
  options = with lib; {
    my = {
      modules = {
        lens = {
          enable = mkEnableOption ''
            Whether to enable lens module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "lens"
        ];
      };
    };
}
