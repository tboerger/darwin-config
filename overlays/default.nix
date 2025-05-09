self: super:

{
  # citrix_workspace = super.citrix_workspace.overrideAttrs (old: {
  #   src = super.fetchurl {
  #     name = "linuxx64-24.2.0.65.tar.gz";
  #     url = "https://dl.webhippie.de/misc/citrix-workspace-x64-24.2.0.65.tar.gz";
  #     hash = "sha256-6utdO9B51OXJcH2mf196Jct2XhnDbQGGEpBlXb8qruQ=";
  #   };
  # });

  vscode-extensions = self.lib.recursiveUpdate super.vscode-extensions {
    dzhavat.bracket-pair-toggler = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "bracket-pair-toggler";
      publisher = "dzhavat";
      version = "0.0.3";
      sha256 = "sha256-mjsh+jwr1ygtOEiZ3juaEuxPZQxdM3QOHxO/e2ht4Ho=";
    };
    shakram02.bash-beautify = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "bash-beautify";
      publisher = "shakram02";
      version = "0.1.1";
      sha256 = "sha256-pg1nGEk+cn7VlmJeDifXkXeZJLRrEFOyW0bK9W6VGfc=";
    };
    signageos.signageos-vscode-sops = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "signageos-vscode-sops";
      publisher = "signageos";
      version = "0.9.2";
      sha256 = "sha256-b1Gp+tL5/e97xMuqkz4EvN0PxI7cJOObusEkcp+qKfM=";
    };
    Vue.volar = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "volar";
      publisher = "Vue";
      version = "2.2.8";
      sha256 = "sha256-efEeTq/y4al38Tdut3bHVdluf3tUYqc6CFPX+ch1gLg=";
    };
    bradlc.vscode-tailwindcss = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "vscode-tailwindcss";
      publisher = "bradlc";
      version = "0.14.9";
      sha256 = "sha256-hMR6Te7T+sDeTPhaMsK/TJDS2S6pCKS36solhvqfPfs=";
    };
    Grafana.vscode-jsonnet = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "vscode-jsonnet";
      publisher = "Grafana";
      version = "0.7.2";
      sha256 = "sha256-Q8VzXzTdHo9h5+eCHHF1bPomPEbRsvouJcUfmFUDGMU=";
    };
    clemenspeters.format-json = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "format-json";
      publisher = "clemenspeters";
      version = "1.0.3";
      sha256 = "sha256-r4IFZJsvLGtLQjOvXootjIB/Epuvst4CtO7laf4u9D8=";
    };
  };

  vimPlugins = self.lib.recursiveUpdate super.vimPlugins {
    dockerfile-vim = self.vimUtils.buildVimPlugin {
      pname = "dockerfile-vim";
      version = "2021-09-06";
      src = self.fetchFromGitHub {
        owner = "ekalinin";
        repo = "Dockerfile.vim";
        rev = "2a31e6bcea5977209c05c728c4253d82fd873c82";
        sha256 = "sha256-MiSGZ5MJ5g37szUuo8XCbuzuAcNBSqYY6hVa/WJwLDY=";
      };
    };
    vim-vividchalk = self.vimUtils.buildVimPlugin {
      pname = "vim-vividchalk";
      version = "2019-11-13";
      src = self.fetchFromGitHub {
        owner = "tpope";
        repo = "vim-vividchalk";
        rev = "be5c6251279bfcfa55cdea8c9a8ccd7a56c8a642";
        sha256 = "sha256-G7wFjIqhHJtUDuXPIlC34C4kRJz85ytHXpVmazrN1/I=";
      };
    };
  };

  gh-dash = super.callPackage ./gh-dash { };
  gh-markdown-preview = super.callPackage ./gh-markdown-preview { };
  gh-poi = super.callPackage ./gh-poi { };

  kubectl-deprecations = super.callPackage ./kubectl-deprecations { };
  kubectl-get-all = super.callPackage ./kubectl-get-all { };
  kubectl-images = super.callPackage ./kubectl-images { };
  kubectl-ktop = super.callPackage ./kubectl-ktop { };
  kubectl-neat = super.callPackage ./kubectl-neat { };
  kubectl-oomd = super.callPackage ./kubectl-oomd { };
  kubectl-outdated = super.callPackage ./kubectl-outdated { };
  kubectl-pexec = super.callPackage ./kubectl-pexec { };
  kubectl-pod-lens = super.callPackage ./kubectl-pod-lens { };
  kubectl-rakkess = super.callPackage ./kubectl-rakkess { };
  kubectl-realname-diff = super.callPackage ./kubectl-realname-diff { };
  kubectl-resource-versions = super.callPackage ./kubectl-resource-versions { };
  kubectl-rolesum = super.callPackage ./kubectl-rolesum { };
  kubectl-split-yaml = super.callPackage ./kubectl-split-yaml { };
  kubectl-view-secret = super.callPackage ./kubectl-view-secret { };
  kubectl-who-can = super.callPackage ./kubectl-who-can { };
  kubectl-whoami = super.callPackage ./kubectl-whoami { };

  khelm = super.callPackage ./khelm { };
  ksops = super.callPackage ./ksops { };

  zcustom = super.callPackage ./zcustom { };
}
