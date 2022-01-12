{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.etcher;

in

{
  options = with lib; {
    my = {
      modules = {
        etcher = {
          enable = mkEnableOption ''
            Whether to enable etcher module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "balenaetcher"
        ];
      };
    };
}
