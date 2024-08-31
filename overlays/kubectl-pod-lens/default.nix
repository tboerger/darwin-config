{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-pod-lens";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "sunny0826";
    repo = "kubectl-pod-lens";
    rev = "v${version}";
    sha256 = "sha256-KoNQWAKdHcdkyMR1lr8CrLc0AxK4WszWqw0zKP2n9sY=";
  };

  vendorHash = "sha256-V6iHO+eNDWP+IEcG2PnCAyGISw/VU8yz5UTe4JZCZKk=";

  doCheck = false;
  subPackages = [ "cmd/plugin" ];

  postInstall = ''
    mv $out/bin/plugin $out/bin/kubectl-pod_lens
  '';

  meta = with lib; {
    description = "A kubectl plugin to show pod-related resources";
    homepage = "https://github.com/sunny0826/kubectl-pod-lens/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
