{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "kubectl-whoami";
  version = "0.0.46";

  src = fetchFromGitHub {
    owner = "rajatjindal";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Az8H0JL1DkFDj1qhm5lo8Vy5GyP6ubObBqZWHpNm+UQ=";
  };

  vendorHash = "sha256-RyeTTtJpnrpIhcfJrrmDP9TiTrwiTHlh4xjskaxG1Go=";

  meta = with lib; {
    description = "Get the subject name using the effective kubeconfig";
    mainProgram = "kubectl-whoami";
    homepage = "https://github.com/rajatjindal/kubectl-whoami";
    changelog = "https://github.com/rajatjindal/kubectl-whoami/releases/tag/v${version}";
    license = licenses.asl20;
    maintainers = [ maintainers.tboerger ];
  };
}
