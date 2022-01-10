{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "rectangle";
  version = "0.50";

  src = fetchurl {
    name = "rectangle-${version}.dmg";
    url = "https://github.com/rxhanson/Rectangle/releases/download/v${version}/Rectangle${version}.dmg";
    sha256 = "b1323721795da2401736a60b300472d0d6c6727f5072992d27e794315556467c";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Rectangle.app" "$out/Applications/Rectangle.app"
    '';

  meta = {
    description = "Window management app based on Spectacle";
    homepage = "https://rectangleapp.com/";
    license = licenses.mit;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
