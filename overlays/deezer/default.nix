{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "deezer";
  version = "5.30.130";

  src = fetchurl {
    name = "deezer-${version}.dmg";
    url = "https://e-cdn-content.dzcdn.net/builds/deezer-desktop/8cF2rAuKxLcU1oMDmCYm8Uiqe19Ql0HTySLssdzLkQ9ZWHuDTp2JBtQOvdrFzWPA/darwin/x64/${version}/DeezerDesktop_${version}.dmg";
    sha256 = "0dd449a8d7269b05df4c54aaf57c0b1137e301f81a55c1c9b211e65606de2b12";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Deezer.app" "$out/Applications/Deezer.app"
    '';

  meta = {
    description = "Deezer is a music streaming app that gives you access to over 73 million tracks worldwide and other audio content like podcasts";
    homepage = "https://www.deezer.com/";
    license = licenses.unfree;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
