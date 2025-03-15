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

  doCheck = false;
  subPackages = [ "." ];

  meta = with lib; {
    description = "A kubectl plugin to summarize RBAC roles";
    homepage = "https://github.com/Ladicle/kubectl-rolesum/";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
