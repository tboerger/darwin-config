{ lib, stdenv, fetchurl, libarchive, p7zip }:
with lib;

stdenv.mkDerivation rec {
  name = "microsoft-teams";
  version = "1.4.00.29478";

  src = fetchurl {
    name = "microsoft-teams-${version}.pkg";
    url = "https://statics.teams.cdn.office.net/production-osx/${version}/Teams_osx.pkg";
    sha256 = "2f7ccb9e583495883af48650da78b2d021148870acf7a5b6b01dd4b37a2d0cb6";
  };

  buildInputs = [ libarchive p7zip ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  unpackPhase = ''
    7z x $src
    bsdtar -xf Payload~
  '';
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Microsoft Teams.app" "$out/Applications/Microsoft Teams.app"
    '';

  meta = {
    description = "Microsoft Teams";
    homepage = "https://teams.microsoft.com";
    license = licenses.unfree;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
