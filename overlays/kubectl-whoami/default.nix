{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-whoami";
  version = "0.0.46";

  src = fetchFromGitHub {
    owner = "rajatjindal";
    repo = "kubectl-whoami";
    rev = "v${version}";
    sha256 = "sha256-Az8H0JL1DkFDj1qhm5lo8Vy5GyP6ubObBqZWHpNm+UQ=";
  };

  vendorHash = "sha256-RyeTTtJpnrpIhcfJrrmDP9TiTrwiTHlh4xjskaxG1Go=";

  doCheck = false;
  subPackages = [ "." ];

  meta = with lib; {
    description = "A kubectl plugin that gets the subject name using the effective kubeconfig";
    homepage = "https://github.com/rajatjindal/kubectl-whoami/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
