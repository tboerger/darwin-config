{ pkgs, lib, config, ... }:

let
  cfg = config.my.modules.libvirt;

in

{
  options = with lib; {
    my = {
      modules = {
        libvirt = {
          enable = mkEnableOption ''
            Whether to enable libvirt module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable ({
      virtualisation = {
        libvirtd = {
          enable = true;
        };
      };
    });
}
