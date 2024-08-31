{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ksops";
  version = "4.3.1";

  src = fetchFromGitHub {
    owner = "viaduct-ai";
    repo = "kustomize-sops";
    rev = "v${version}";
    sha256 = "sha256-zEiRbbQzUqFHNtrzyZDNEaXT/T+TfB6KqOXkdjrCiW4=";
  };

  vendorHash = "sha256-aNrhS4oCG5DB3yjolWL49DtNqZA5dNRqQ2YPBeKQzWI=";

  postInstall = ''
    mv $out/bin/kustomize-sops $out/bin/ksops
  '';

  doCheck = false;

  meta = with lib; {
    description = "A Flexible Kustomize Plugin for SOPS Encrypted Resource";
    longDescription = ''
      KSOPS can be used to decrypt any Kubernetes resource, but is most commonly
      used to decrypt encrypted Kubernetes Secrets and ConfigMaps.
    '';
    homepage = "https://github.com/viaduct-ai/kustomize-sops";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
