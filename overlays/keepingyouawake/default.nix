{ lib, stdenv, fetchurl, unzip }:
with lib;

stdenv.mkDerivation rec {
  name = "keepingyouawake";
  version = "1.6.1";

  src = fetchurl {
    name = "keepingyouawake-${version}.zip";
    url = "https://github.com/newmarcel/KeepingYouAwake/releases/download/${version}/KeepingYouAwake-${version}.zip";
    sha256 = "5830c1b282fa862ed717a60eb08afc3c7a935b5ccf5b064e12c61373952034ff";
  };

  buildInputs = [ unzip ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r KeepingYouAwake.app "$out/Applications/KeepingYouAwake.app"
    '';

  meta = {
    description = "Prevents your Mac from going to sleep";
    homepage = "https://keepingyouawake.app/";
    license = licenses.mit;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
