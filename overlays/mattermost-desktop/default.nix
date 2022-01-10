{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "mattermost-desktop";
  version = "5.0.2";

  src = fetchurl {
    name = "mattermost-desktop-${version}.dmg";
    url = "https://releases.mattermost.com/desktop/${version}/mattermost-desktop-${version}-mac-x64.dmg";
    sha256 = "2a04849007272f5ed3f130823b0dc84d1a3ebf3d2312846c06e212bdf297adde";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Mattermost.app" "$out/Applications/Mattermost.app"
    '';

  meta = {
    description = "Mattermost Desktop client
";
    homepage = "https://about.mattermost.com/";
    license = licenses.asl20;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
