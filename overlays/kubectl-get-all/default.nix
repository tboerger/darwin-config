{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "kubectl-get-all";
  version = "1.4.1";

  src = fetchFromGitHub {
    owner = "stackitcloud";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-fVe9PY5MFX6Yc31dLi6C1bXZ39Em+Piq4EWoQce8srY=";
  };

  vendorHash = "sha256-ifOKYXgIZcKT1jov5cGBtH3IdZBVBqHO/JNkMlDXops=";

  doCheck = false;
  subPackages = [ "." ];

  meta = with lib; {
    description = "A kubectl plugin that shows really all resources";
    homepage = "https://github.com/stackitcloud/kubectl-get-all/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
