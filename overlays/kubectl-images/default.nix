{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-images";
  version = "0.6.3";

  src = fetchFromGitHub {
    owner = "chenjiandongx";
    repo = "kubectl-images";
    rev = "v${version}";
    sha256 = "sha256-FHfj2qRypqQA0Vj9Hq7wuYd0xmpD+IZj3MkwKljQio0=";
  };

  vendorHash = "sha256-8zV2iZ10H5X6fkRqElfc7lOf3FhmDzR2lb3Jgyhjyio=";

  doCheck = false;
  subPackages = [ "cmd" ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/kubectl-images
  '';

  meta = with lib; {
    description = "A kubectl plugin to show used container images";
    homepage = "https://github.com/chenjiandongx/kubectl-images/";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
