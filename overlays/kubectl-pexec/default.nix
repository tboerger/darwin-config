{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "kubectl-pexec";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "ssup2";
    repo = "kpexec";
    rev = "v${version}";
    sha256 = "sha256-3teKIjBc8ToCON+LcVD+WCOSzmYmDHW0T1t8tbodg3Q=";
  };

  vendorHash = "sha256-HmRwez3NFSF97Dc6fD/Tt78qNDjovkhlfqloYo2qG68=";

  subPackages = [ "cmd/kpexec" ];

  ldflags = [
    "-X github.com/ssup2/kpexec/pkg/cmd/kpexec.build=kubectlPlugin"
  ];

  postInstall = ''
    mv $out/bin/kpexec $out/bin/kubectl-pexec
  '';

  meta = with lib; {
    description = "Execute process with privileges in a pod";
    mainProgram = "kubectl-pexec";
    homepage = "https://github.com/ssup2/kpexec";
    changelog = "https://github.com/ssup2/kpexec/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = [ maintainers.tboerger ];
  };
}
