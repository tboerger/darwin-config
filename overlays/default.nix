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

  kubectl-get-all = super.callPackage ./kubectl-get-all { };
  kubectl-outdated = super.callPackage ./kubectl-outdated { };
  kubectl-pexec = super.callPackage ./kubectl-pexec { };
  kubectl-realname-diff = super.callPackage ./kubectl-realname-diff { };
  kubectl-rolesum = super.callPackage ./kubectl-rolesum { };
  kubectl-slice = super.callPackage ./kubectl-slice { };
  kubectl-whoami = super.callPackage ./kubectl-whoami { };
  kubectl-view-secret = super.callPackage ./kubectl-view-secret { };

  khelm = super.callPackage ./khelm { };
  ksops = super.callPackage ./ksops { };

  zcustom = super.callPackage ./zcustom { };
}
