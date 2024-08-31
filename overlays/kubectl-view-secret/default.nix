{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-view-secret";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "elsesiy";
    repo = "kubectl-view-secret";
    rev = "v${version}";
    sha256 = "sha256-5X5rOoERx6HoG3cOBpYm12anMXXDjTtHZzQOOlJeJSs=";
  };

  vendorHash = "sha256-oQvmS05nev+ypfkKAlTN+JbzPux5iAzHsojW8SxtB70=";

  doCheck = false;
  subPackages = [ "cmd" ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/kubectl-view_secret
  '';

  meta = with lib; {
    description = "A kubectl plugin to decode Kubernetes secrets";
    homepage = "https://github.com/elsesiy/kubectl-view-secret/";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
