{ pkgs, lib, config, options, inputs, ... }:

let
  cfg = config.my.modules.tools;

  python = pkgs.python39.withPackages (p: with p; [
    pkgs.python39Packages.ansible-doctor
    pkgs.python39Packages.ansible-later

    ansible-core
    ansible-lint
    hcloud
    passlib
    requests
    boto3
    botocore
    yamllint
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
          act
          coreutils
          git
          git-chglog
          gnumake
          gomplate
          gopass
          graphviz
          htop
          httpie
          hub
          ipcalc
          jq
          minio-client
          ngrok
          nmap
          nodejs-16_x
          p7zip
          php
          php80Packages.composer
          pwgen
          python
          reflex
          rsync
          s3cmd
          shellcheck
          silver-searcher
          sops
          tmux
          tree
          unstable.terraform
          unstable.terragrunt
          upx
          vim
          wget
          yarn

          inputs.agenix.defaultPackage.x86_64-darwin
        ];
      };

      homebrew = {
        brews = [
          "gnu-sed"
          "yq"
        ];
      };
    };
}
