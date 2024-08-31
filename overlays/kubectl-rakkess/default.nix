{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-rakkess";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "corneliusweig";
    repo = "rakkess";
    rev = "v${version}";
    sha256 = "sha256-igovWWk8GfNmOS/NbZWfv9kox6QLNIbM09jdvA/lL3A=";
  };

  vendorHash = "sha256-lVxJ4wFBhHc8JVpkmqphLYPE9Z8Cr6o+aAHvC1naqyE=";

  doCheck = false;
  subPackages = [ "." ];

  postInstall = ''
    mv $out/bin/rakkess $out/bin/kubectl-rakkess
  '';

  meta = with lib; {
    description = "A kubectl plugin to show an access matrix";
    homepage = "https://github.com/corneliusweig/rakkess/";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
