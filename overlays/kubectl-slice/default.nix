{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "kubectl-slice";
  version = "1.4.2";

  src = fetchFromGitHub {
    owner = "patrickdappollonio";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-C9YxMP9MCKJXh3wQ1JoilpzI3nIH3LnsTeVPMzri5h8=";
  };

  vendorHash = "sha256-Lly8gGLkpBAT+h1TJNkt39b5CCrn7xuVqrOjl7RWX7w=";

  meta = with lib; {
    description = "Split Kubernetes files into smaller files";
    mainProgram = "kubectl-slice";
    homepage = "https://github.com/patrickdappollonio/kubectl-slice";
    changelog = "https://github.com/patrickdappollonio/kubectl-slice/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = [ maintainers.tboerger ];
  };
}
