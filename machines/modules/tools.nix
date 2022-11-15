{ pkgs, lib, config, options, inputs, ... }:
with lib;

let
  ansible-doctor = pkgs.ansible-doctor.overrideAttrs (final: prev: {
    postPatch = prev.postPatch + ''
      substituteInPlace pyproject.toml \
        --replace 'colorama = "0.4.5"' 'colorama = "*"'
    '';
  });

  ansible-later = pkgs.ansible-later.overrideAttrs (final: prev: {
    postPatch = prev.postPatch + ''
      substituteInPlace pyproject.toml \
        --replace 'colorama = "0.4.5"' 'colorama = "*"'
    '';
  });

  checkov = pkgs.checkov.overrideAttrs (final: prev: {
    disabledTests = prev.disabledTests ++ [
      "test_file_with_class_attribute"
      "test_file_with_class_const"
      "test_dataclass_skip"
    ];
  });

  python310 = pkgs.python310.withPackages (p: with p; [
    ansible-core
    ansible-doctor
    ansible-later
    ansible-lint

    hcloud
    yamllint

    boto3
    botocore
    passlib
    requests
  ]);

in
{
  config = {
    environment = {
      systemPackages = with pkgs; [
        python310

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
        reflex
        rsync
        s3cmd
        shellcheck
        silver-searcher
        sops
        tldr
        tmux
        tree
        upx
        vim
        wget

        checkov
        terraform
        terragrunt
        tflint
        tfsec

        nodejs-16_x
        yarn
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
