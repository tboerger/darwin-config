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
      # environment = {
      #   systemPackages = with pkgs; [
      #     keepingyouawake
      #   ];
      # };
    };
}
