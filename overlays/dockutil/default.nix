{ lib, stdenv, fetchFromGitHub, unzip }:
with lib;

stdenv.mkDerivation rec {
  name = "dockutil";
  version = "2.0.5";

  src = fetchFromGitHub {
    owner = "kcrawford";
    repo = name;
    rev = version;
    sha256 = "sha256-8tDkueCTCtvxc7owp3K9Tsrn4hL79CM04zBNv7AcHgA=";
  };

  installPhase = ''
    mkdir -pv $out/bin
    cp "scripts/dockutil" "$out/bin/dockutil"
  '';

  meta = {
    description = "Tool for managing dock items";
    homepage = "https://github.com/kcrawford/dockutil";
    license = licenses.asl20;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
