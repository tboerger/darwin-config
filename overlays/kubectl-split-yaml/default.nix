{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-split-yaml";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "nathforge";
    repo = "kubectl-split-yaml";
    rev = "v${version}";
    sha256 = "sha256-/+9HB1MXVbOoTJ3HytcM7QpMcI97dylvY2AYVG9sADc=";
  };

  vendorHash = "sha256-WW4oA6qr7cGF2Lq+SgNUBhiSmZxVN8zL96kU5XbvcFQ=";

  doCheck = false;
  subPackages = [ "cmd/kubectl-split-yaml" ];

  postInstall = ''
    mv $out/bin/kubectl-split-yaml $out/bin/kubectl-split_yaml
  '';

  meta = with lib; {
    description = "A kubectl plugin to split Kubernetes YAML output into multiple files";
    homepage = "https://github.com/nathforge/kubectl-split-yaml/";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
