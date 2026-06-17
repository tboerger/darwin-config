{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule rec {
  pname = "kubectl-cost";
  version = "0.6.6";

  src = fetchFromGitHub {
    owner = "kubecost";
    repo = "kubectl-cost";
    rev = "v${version}";
    sha256 = "sha256-Nqpt2cuP6WNRLh7jit1lC9t/BKcWQ5AFFOLWMCVp7GI=";
  };

  vendorHash = "sha256-63gEq0JOTp8LT5/x7zihMYBBcxiwIkvGF3dgEQdfd8M=";

  doCheck = false;
  subPackages = [ "./cmd/kubectl-cost" ];

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "CLI for determining the cost of Kubernetes workloads";
    mainProgram = "cost";
    homepage = "https://github.com/kubecost/kubectl-cost/";
    changelog = "https://github.com/kubecost/kubectl-cost/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.tboerger ];
  };
}
