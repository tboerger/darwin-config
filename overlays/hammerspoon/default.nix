{ lib, stdenv, fetchurl, unzip }:
with lib;

stdenv.mkDerivation rec {
  name = "hammerspoon";
  version = "0.9.93";

  src = fetchurl {
    name = "hammerspoon-${version}.zip";
    url = "https://github.com/Hammerspoon/hammerspoon/releases/download/${version}/Hammerspoon-${version}.zip";
    sha256 = "b49282ca1c90ea555f5e1cd1a405792b98ac5c5472a16b44fed1bd3e53da8e44";
  };

  buildInputs = [ unzip ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r Hammerspoon.app "$out/Applications/Hammerspoon.app"
    '';

  meta = {
    description = "Staggeringly powerful macOS desktop automation with Lua";
    homepage = "https://www.hammerspoon.org/";
    license = licenses.mit;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
