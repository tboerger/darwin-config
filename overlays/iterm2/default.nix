{ lib, stdenv, fetchurl, unzip }:
with lib;

stdenv.mkDerivation rec {
  name = "iterm2";
  version = "3.4.15";

  src = fetchurl {
    name = "iterm2-${version}.zip";
    url = "https://iterm2.com/downloads/stable/iTerm2-${replaceStrings ["."] ["_"] version}.zip";
    sha256 = "32594ee038efdda96b5d7a325c11219bac667f69ca952a5ff080b26079871b78";
  };

  buildInputs = [ unzip ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r iTerm.app "$out/Applications/iTerm.app"
    '';

  meta = {
    description = "Replacement for Terminal and the successor to iTerm";
    homepage = "https://iterm2.com";
    license = licenses.gpl2;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
