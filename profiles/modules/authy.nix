{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.authy;

in

{
  options = with lib; {
    my = {
      modules = {
        authy = {
          enable = mkEnableOption ''
            Whether to enable authy module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "authy"
        ];
      };
    };
}
