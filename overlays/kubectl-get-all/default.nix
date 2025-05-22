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

  postInstall = ''
    mv $out/bin/kubectl-get-all $out/bin/kubectl-get_all
  '';

  meta = with lib; {
    description = "Like kubectl get all, but get really all resources";
    mainProgram = "kubectl-get_all";
    homepage = "https://github.com/stackitcloud/kubectl-get-all";
    changelog = "https://github.com/stackitcloud/kubectl-get-all/releases/tag/v${version}";
    license = licenses.asl20;
    maintainers = [ maintainers.tboerger ];
  };
}
