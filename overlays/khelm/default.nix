{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "khelm";
  version = "2.5.0";

  src = fetchFromGitHub {
    owner = "mgoltzsche";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-WCneZIi70JJOAi8NeUNHa8Z4+9e0vn5YiHy6znCo8m8=";
  };

  vendorHash = "sha256-rAPdPORW+xvrKkhpCXKRyVUhD/5f10FgS3s/aBOGaPA=";

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
