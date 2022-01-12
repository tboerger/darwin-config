{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.multipass;

in

{
  options = with lib; {
    my = {
      modules = {
        multipass = {
          enable = mkEnableOption ''
            Whether to enable multipass module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "multipass"
        ];
      };
    };
}
