{ stdenv, fetchurl, undmg }:

stdenv.mkDerivation rec {
  pname = "iterm2";
  version = "3.4.15";

  src = fetchurl {
    name = "iTerm2-${version}.dmg";
    url = "https://iterm2.com/downloads/stable/iTerm2-${replaceStrings ["."] ["_"] version}.zip";
    sha256 = "32594ee038efdda96b5d7a325c11219bac667f69ca952a5ff080b26079871b78";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r iTerm2.app "$out/Applications/iTerm2.app"
    '';

  meta = with stdenv.lib; {
    description = "Replacement for Terminal and the successor to iTerm";
    homepage = "https://iterm2.com";
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
