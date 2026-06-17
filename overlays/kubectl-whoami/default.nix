{
  lib,
  buildGoModule,
  fetchFromGitHub,
  versionCheckHook,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "kubectl-whoami";
  version = "0.0.48";

  src = fetchFromGitHub {
    owner = "rajatjindal";
    repo = "kubectl-whoami";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Gtf71bbTJpbz+a+BWHLD+VOiGQHPs7R6blwBwj/cdHU=";
  };

  vendorHash = "sha256-KRgVIlLfq76ZQKaTOb+PnGiOd020uf+GmxBR10wsqgo=";

  ldflags = [
    "-X github.com/rajatjindal/kubectl-whoami/pkg/cmd.Version=${finalAttrs.version}"
  ];

  versionCheckProgramArg = [ "--version" ];
  nativeInstallCheckInputs = [
    versionCheckHook
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Get the subject name using the effective kubeconfig";
    mainProgram = "kubectl-whoami";
    homepage = "https://github.com/rajatjindal/kubectl-whoami";
    changelog = "https://github.com/rajatjindal/kubectl-whoami/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.tboerger ];
  };
})
