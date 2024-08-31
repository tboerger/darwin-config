{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-get-all";
  version = "1.3.8";

  src = fetchFromGitHub {
    owner = "corneliusweig";
    repo = "ketall";
    rev = "v${version}";
    sha256 = "sha256-Mau57mXS78fHyeU0OOz3Tms0WNu7HixfAZZL3dmcj3w=";
  };

  vendorHash = "sha256-lxfWJ7t/IVhIfvDUIESakkL8idh+Q/wl8B1+vTpb5a4=";

  doCheck = false;
  subPackages = [ "." ];

  postInstall = ''
    mv $out/bin/ketall $out/bin/kubectl-get_all
  '';

  meta = with lib; {
    description = "A kubectl plugin that shows really all resources";
    homepage = "https://github.com/corneliusweig/ketall/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
