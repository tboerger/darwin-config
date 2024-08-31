{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-oomd";
  version = "0.0.7";

  src = fetchFromGitHub {
    owner = "jdockerty";
    repo = "kubectl-oomd";
    rev = "v${version}";
    sha256 = "sha256-guehDP+uohQ2VD4GvkQ0Zf59XX7xewfUzcqzV/ojf6Q=";
  };

  vendorHash = "sha256-/hlCDJzkq4fhlovgTDetzVgBZvwy5AwklJIPhTmYe4s=";

  doCheck = false;
  subPackages = [ "cmd/plugin" ];

  postInstall = ''
    mv $out/bin/plugin $out/bin/kubectl-oomd
  '';

  meta = with lib; {
    description = "A kubectl plugin that shows pods/containers which have recently been OOMKilled";
    homepage = "https://github.com/jdockerty/kubectl-oomd/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
