{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-rolesum";
  version = "1.5.5";

  src = fetchFromGitHub {
    owner = "Ladicle";
    repo = "kubectl-rolesum";
    rev = "v${version}";
    sha256 = "sha256-IO0QMDTbQXxs6UvaiobmrqVTHdmBTnUA3kMYKMgc+A8=";
  };

  vendorHash = "sha256-gQrMTD5toSeMPJb9LEbLaU1pB7DzOzSsVqDaL+cPvcw=";

  doCheck = false;
  subPackages = [ "." ];

  meta = with lib; {
    description = "A kubectl plugin to summarize RBAC roles";
    homepage = "https://github.com/Ladicle/kubectl-rolesum/";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
