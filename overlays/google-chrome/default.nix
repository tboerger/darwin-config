{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "google-chrome";

  src = fetchurl {
    name = "google-chrome.dmg";
    url = "https://dl.google.com/chrome/mac/universal/stable/CHFA/googlechrome.dmg";
    sha256 = "2d96c7e923ca20d7b2b872cdb07c96ad9e90ea4c1b9eb52c6df9f0fa3cfea018";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Google Chrome.app" "$out/Applications/Google Chrome.app"
    '';

  meta = {
    description = "The browser built by Google";
    homepage = "https://www.google.com/chrome/browser";
    license = licenses.unfree;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
