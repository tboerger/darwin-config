{ pkgs, lib, config, options, inputs, ... }:
with lib;

let
  python = pkgs.python39.withPackages (p: with p; [
    ansible-core
    ansible-doctor
    ansible-later
    ansible-lint
    boto3
    botocore
    hcloud
    passlib
    requests
    yamllint
  ]);

in
{
  config = {
    environment = {
      systemPackages = with pkgs; [
        protoc-gen-openapiv2

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
        p7zip
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
        upx
        vim
        wget

        # checkov
        terraform
        terragrunt
        tflint
        tfsec

        nodejs-16_x
        yarn

        php80
        php80Packages.composer
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
