{ lib, stdenv, fetchurl, undmg }:
with lib;

stdenv.mkDerivation rec {
  name = "discord";
  version = "0.0.264";

  src = fetchurl {
    name = "discord-${version}.dmg";
    url = "https://dl.discordapp.net/apps/osx/${version}/Discord.dmg";
    sha256 = "f7e8e401d1d1526eef3176cd75e38807cf73e25c4fe76b42d65443ec56ed74cb";
  };

  buildInputs = [ undmg ];
  sourceRoot = ".";
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
      mkdir -p "$out/Applications"
      cp -r "Discord.app" "$out/Applications/Discord.app"
    '';

  meta = {
    description = "All-in-one cross-platform voice and text chat for gamers";
    homepage = "https://discord.com/";
    license = licenses.unfree;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
