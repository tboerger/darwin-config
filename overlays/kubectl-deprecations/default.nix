{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-deprecations";
  version = "1.7.1";

  src = fetchFromGitHub {
    owner = "kubepug";
    repo = "kubepug";
    rev = "v${version}";
    sha256 = "sha256-VNxaYQy81U0JWd6KS0jCvMexpyWL4v1cKpjxLRkxBLE=";
  };

  vendorHash = "sha256-HVsaQBd7fSZp2fOpOOmlDhYrHcHqWKiYWPFLQX0azEw=";

  doCheck = false;
  subPackages = [ "." ];

  postInstall = ''
    mv $out/bin/kubepug $out/bin/kubectl-deprecations
  '';

  meta = with lib; {
    description = "A kubectl plugin to preupgrade checks";
    homepage = "https://github.com/kubepug/kubepug/";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
