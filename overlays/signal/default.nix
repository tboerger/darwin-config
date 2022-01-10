{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "signal";
  version = "5.27.1";

  src = fetchurl {
    name = "signal-${version}.dmg";
    url = "https://updates.signal.org/desktop/signal-desktop-mac-universal-${version}.dmg";
    sha256 = "dcdc9e5bb6af6faeba9d301b6e6711727647d772e6996dc4994e97c316160b41";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Signal.app" "$out/Applications/Signal.app"
    '';

  meta = {
    description = "Private, simple, and secure messenger";
    homepage = "https://signal.org/";
    license = licenses.agpl3Only;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
