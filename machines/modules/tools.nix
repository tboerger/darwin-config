{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.tools;

  anyconfig = pkgs.python39.pkgs.buildPythonPackage rec {
    pname = "anyconfig";
    version = "0.12.0";

    src = pkgs.python39.pkgs.fetchPypi {
      inherit pname version;
      sha256 = "sha256-MJHXZ1dAaG+t6FdVU38qfGzO+oZZxbtWF04C3tdLltU=";
    };

    propagatedBuildInputs = [
      pkgs.python39.pkgs.setuptools
    ];

    doCheck = false;

    meta = {
      homepage = "https://github.com/ssato/python-anyconfig";
      license = lib.licenses.mit;
      description = "Python library provides common APIs to load and dump configuration files in various formats";
    };
  };

  nested-lookup = pkgs.python39.pkgs.buildPythonPackage rec {
    pname = "nested-lookup";
    version = "0.2.23";

    src = pkgs.python39.pkgs.fetchPypi {
      inherit pname version;
      sha256 = "sha256-e4kAyOcG5PjDMJ694imxCfSHsVuajK4nuZAmrRHktkw=";
    };

    propagatedBuildInputs = [
      pkgs.python39.pkgs.six
    ];

    doCheck = false;

    meta = {
      homepage = "https://github.com/russellballestrini/nested-lookup";
      license = lib.licenses.publicDomain;
      description = "Python functions for working with deeply nested documents (lists and dicts)";
    };
  };

  ansible-later = pkgs.python39.pkgs.buildPythonPackage rec {
    pname = "ansible-later";
    version = "2.0.6";
    format = "pyproject";

    src = pkgs.fetchFromGitHub {
      owner = "thegeeklab";
      repo = "ansible-later";
      rev = "v${version}";
      sha256 = "sha256-vg9ryzl9ZeOGuFLL1yeJ3vGNPdo3ONmCQozY6DK6miY=";
    };

    postInstall = ''
      rm $out/lib/python*/site-packages/LICENSE
    '';

    postPatch = ''
      substituteInPlace pyproject.toml \
        --replace 'PyYAML = "6.0"' 'PyYAML = "*"' \
        --replace 'unidiff = "0.7.3"' 'unidiff = "*"' \
        --replace 'jsonschema = "4.4.0"' 'jsonschema = "*"'
    '';

    nativeBuildInputs = [
      pkgs.python39.pkgs.poetry-core
    ];

    propagatedBuildInputs = [
      pkgs.python39.pkgs.unidiff
      pkgs.python39.pkgs.toolz
      pkgs.python39.pkgs.appdirs
      pkgs.python39.pkgs.flake8
      pkgs.python39.pkgs.jsonschema
      pkgs.python39.pkgs.yamllint
      pkgs.python39.pkgs.python-json-logger
      pkgs.python39.pkgs.colorama
      pkgs.python39.pkgs.jsonschema
      pkgs.python39.pkgs.pyyaml
      anyconfig
      nested-lookup
    ];

    meta = {
      homepage = "https://github.com/thegeeklab/ansible-later";
      license = lib.licenses.mit;
      description = "Another best practice scanner for Ansible roles and playbooks";
    };
  };

  ansible-doctor = pkgs.python39.pkgs.buildPythonPackage rec {
    pname = "ansible-doctor";
    version = "1.2.1";
    format = "pyproject";

    src = pkgs.fetchFromGitHub {
      owner = "thegeeklab";
      repo = "ansible-doctor";
      rev = "v${version}";
      sha256 = "sha256-2Jaf7asU4c7kw9v9dUYDL4/M2Y/2qhMM3m0jqYiobUI=";
    };

    postInstall = ''
      rm $out/lib/python*/site-packages/LICENSE
    '';

    postPatch = ''
      substituteInPlace pyproject.toml \
        --replace 'environs = "9.5.0"' 'environs = "*"' \
        --replace 'jsonschema = "4.4.0"' 'jsonschema = "*"' \
        --replace '"ruamel.yaml" = "0.17.21"' '"ruamel.yaml" = "*"'
    '';

    nativeBuildInputs = [
      pkgs.python39.pkgs.poetry-core
    ];

    propagatedBuildInputs = [
      pkgs.python39.pkgs.jinja2
      pkgs.python39.pkgs.colorama
      pkgs.python39.pkgs.python-json-logger
      pkgs.python39.pkgs.pathspec
      pkgs.python39.pkgs.environs
      pkgs.python39.pkgs.jsonschema
      pkgs.python39.pkgs.appdirs
      pkgs.python39.pkgs.ruamel-yaml
      anyconfig
      nested-lookup
    ];

    meta = {
      homepage = "https://github.com/thegeeklab/ansible-doctor";
      license = lib.licenses.lgpl3Only;
      description = "Annotation based documentation for your Ansible roles";
    };
  };

  ansible-lint = pkgs.python39.pkgs.buildPythonPackage rec {
    pname = "ansible-lint";
    version = "5.4.0";
    format = "pyproject";

    src = pkgs.fetchFromGitHub {
      owner = "ansible-community";
      repo = "ansible-lint";
      rev = "v${version}";
      sha256 = "sha256-Fwe0awP+OpWqEqWtZQuNo0UyxMPpHIoAtTXf8V4gR+w=";
    };

    # postInstall = ''
    #   rm $out/lib/python*/site-packages/LICENSE
    # '';

    # postPatch = ''
    #   substituteInPlace pyproject.toml \
    #     --replace 'environs = "9.5.0"' 'environs = "*"' \
    #     --replace 'jsonschema = "4.4.0"' 'jsonschema = "*"' \
    #     --replace '"ruamel.yaml" = "0.17.21"' '"ruamel.yaml" = "*"'
    # '';

    # nativeBuildInputs = [
    #   pkgs.python39.pkgs.poetry-core
    # ];

    propagatedBuildInputs = [
      pkgs.python39.pkgs.wcmatch
      pkgs.python39.pkgs.rich
      pkgs.python39.pkgs.pyyaml
      pkgs.python39.pkgs.enrich
    #   pkgs.python39.pkgs.colorama
    #   pkgs.python39.pkgs.python-json-logger
    #   pkgs.python39.pkgs.pathspec
    #   pkgs.python39.pkgs.environs
    #   pkgs.python39.pkgs.jsonschema
    #   pkgs.python39.pkgs.appdirs
      pkgs.python39.pkgs.ruamel-yaml
      pkgs.python39.pkgs.packaging
      pkgs.python39.pkgs.tenacity
    #   anyconfig
    #   nested-lookup
    ];

    meta = {
      homepage = "https://github.com/ansible-community/ansible-lint";
      license = lib.licenses.lgpl3Only;
      description = "Best practices checker for Ansible";
    };
  };

  python = pkgs.python39.withPackages (p: with p; [
    ansible-core
    ansible-doctor
    ansible-later
    ansible-lint
    hcloud
    passlib
    requests
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
          # yq
          act
          aws
          azure-cli
          coreutils
          git
          git-chglog
          gnumake
          gomplate
          gopass
          hcloud
          htop
          httpie
          hub
          hugo
          ipcalc
          jq
          minio-client
          ngrok
          nmap
          nodejs-16_x
          p7zip
          pwgen
          python
          reflex
          rsync
          s3cmd
          shellcheck
          silver-searcher
          sops
          terraform
          tmux
          tree
          upx
          vim
          wget
        ];
      };
    };
}
