{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "khelm";
  version = "2.4.2";

  src = fetchFromGitHub {
    owner = "mgoltzsche";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-9h6OcLpOW8snGUfsRGMq+/PD/feMkNnGZroNiC4D2qU=";
  };

  vendorHash = "sha256-gh9jXv4jDkVb4Rty53V8G6GsvbzTgmz8QeWQm0XEtrQ=";

  doCheck = false;

  meta = with lib; {
    description = "A Flexible Kustomize Plugin for Helm chart templating";
    longDescription = ''
      A Helm chart templating CLI, helm to kustomize converter, kpt function and
      kustomize plugin.
    '';
    homepage = "https://github.com/mgoltzsche/khelm";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
