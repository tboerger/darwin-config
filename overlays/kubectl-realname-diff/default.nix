{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "kubectl-realname-diff";
  version = "0.4.2";

  src = fetchFromGitHub {
    owner = "hhiroshell";
    repo = "kubectl-realname-diff";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-cT5ffrTn66y6Z9ICoiVuQsrjlTtVCoy81LmAS3CrXbs=";
  };

  vendorHash = "sha256-7O6JDhOTkAryFVvto2IkiPM9SkVF+wyDrY9kG4n4/SA=";

  subPackages = [ "cmd/kubectl-realname_diff" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Diff live and local resources ignoring Kustomize suffixes";
    mainProgram = "kubectl-realname_diff";
    homepage = "https://github.com/hhiroshell/kubectl-realname-diff";
    changelog = "https://github.com/hhiroshell/kubectl-realname-diff/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.tboerger ];
  };
})
