{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.tools;

  python = pkgs.python39.withPackages (p: with p; [
    ansible-core
    hcloud
    requests
    passlib
    # pkgs.ansible-later
  ]);
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
          aws
          azure-cli
          git
          git-chglog
          gnumake
          gomplate
          gopass
          hcloud
          htop
          httpie
          hub
          ipcalc
          jq
          minio-client
          ngrok
          nmap
          p7zip
          platinum-searcher
          pwgen
          python
          reflex
          rsync
          s3cmd
          shellcheck
          sops
          terraform
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
