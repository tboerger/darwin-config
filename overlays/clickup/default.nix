{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "clickup";

  src = fetchurl {
    name = "clickup.dmg";
    url = "https://desktop.clickup.com/mac";
    sha256 = "a8cd192fdab4e2302e15d55c62bb35d9ddd91dff393d40140d7ce274e890a9a6";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "ClickUp.app" "$out/Applications/ClickUp.app"
    '';

  meta = {
    description = "Everything you need for work, all in one place";
    homepage = "https://clickup.com/";
    license = licenses.unfree;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
