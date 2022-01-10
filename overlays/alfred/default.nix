{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "alfred";
  version = "4.6.1_1274";

  src = fetchurl {
    name = "alfred-${version}.dmg";
    url = "https://cachefly.alfredapp.com/Alfred_${version}.dmg";
    sha256 = "2851a6da00e8ad85bb000931a1d9dbda00d27402d4e3b7c8fbd77d8956b009b3";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Alfred.app" "$out/Applications/Alfred.app"
    '';

  meta = {
    description = "App for macOS which boosts your efficiency with hotkeys, keywords, text expansion and more";
    homepage = "https://www.alfredapp.com/";
    license = licenses.unfree;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
