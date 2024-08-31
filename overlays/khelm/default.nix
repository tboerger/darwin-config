{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "khelm";
  version = "2.3.3";

  src = fetchFromGitHub {
    owner = "mgoltzsche";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-S4+aNte+L5aPQga3543AeRuorpVtsTFHWGmcl5Djxd8=";
  };

  vendorHash = "sha256-lpJ+qcUnTW32j00/5MtwTojtfrlLysSkAArnUnjJQmU=";

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
