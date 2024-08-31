{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-moco";
  version = "0.20.2";

  src = fetchFromGitHub {
    owner = "cybozu-go";
    repo = "moco";
    rev = "v${version}";
    sha256 = "sha256-AubGcEFogKNJI6fDyc95yKdMzqAaQ4rEH+etJ1tTmB4=";
  };

  vendorHash = "sha256-Njy+oGu7TBShDjFd06ijRv6x6xlsYYdy2upvLL1MBwQ=";

  doCheck = false;
  subPackages = [ "cmd/kubectl-moco" ];

  meta = with lib; {
    description = "A kubectl plugin that interacts with the Moco MySQL operator";
    homepage = "https://github.com/cybozu-go/moco/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
