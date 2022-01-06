{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.tools;

in

{
  options = with lib; {
    my = {
      modules = {
        tools = {
          enable = mkEnableOption ''
            Whether to enable tools module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          ansible
          git
          git-chglog
          gnumake
          gomplate
          hcloud
          httpie
          hub
          ipcalc
          jq
          minio-client
          ngrok
          nmap
          platinum-searcher
          pwgen
          reflex
          rsync
          s3cmd
          shellcheck
          sops
          tmux
          tree
          upx
          vim
          wget
          yq
        ];
      };
    };
}
