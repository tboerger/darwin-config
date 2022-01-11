{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.kya;

in

{
  options = with lib; {
    my = {
      modules = {
        kya = {
          enable = mkEnableOption ''
            Whether to enable kya module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "keepingyouawake"
        ];
      };
    };
}
