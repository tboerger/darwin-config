{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "franz";
  version = "5.7.0";

  src = fetchurl {
    name = "franz-${version}.dmg";
    url = "https://github.com/meetfranz/franz/releases/download/v${version}/franz-${version}.dmg";
    sha256 = "197f143c7f3cfae472b1c6a66f6387f948357a94ae12a04977293ed41662a8ff";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Franz.app" "$out/Applications/Franz.app"
    '';

  meta = {
    description = "A free messaging app that combines chat & messaging services into one application";
    homepage = "https://meetfranz.com/";
    license = licenses.asl20;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
