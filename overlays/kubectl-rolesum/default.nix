{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "kubectl-rolesum";
  version = "1.5.6";

  src = fetchFromGitHub {
    owner = "Ladicle";
    repo = "kubectl-rolesum";
    rev = "v${version}";
    sha256 = "sha256-Nj4LyAruyDyX9NR0bTQzuAaLPBZNLeVWilobGlHop/o=";
  };

  vendorHash = "sha256-nt/GOG4kdUrmOsMnFs6fNwiBZDVXoa7OdwnZsD2cPy8=";

  meta = with lib; {
    description = "Summarize Kubernetes RBAC roles for the specified subjects";
    mainProgram = "kubectl-rolesum";
    homepage = "https://github.com/Ladicle/kubectl-rolesum";
    changelog = "https://github.com/Ladicle/kubectl-rolesum/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = [ maintainers.tboerger ];
  };
}
