{ lib, stdenv, fetchurl, libarchive, p7zip }:
with lib;

stdenv.mkDerivation rec {
  pname = "dockutil";
  version = "2.0.5";

  src = fetchurl {
    url = "https://github.com/kcrawford/dockutil/releases/download/${version}/dockutil-${version}.pkg";
    sha256 = "sha256-kZ7dOG8SSh25DgcbvkgPvEFGZIVz4fv0kWN41pbeNlw=";
  };

  dontBuild = true;
  nativeBuildInputs = [ libarchive p7zip ];

  unpackPhase = ''
    7z x $src
    bsdtar -xf Payload~
  '';

  installPhase = ''
    mkdir -pv $out/bin
    cp "usr/local/bin/dockutil" "$out/bin/dockutil"
  '';

  meta = {
    description = "Tool for managing dock items";
    homepage = "https://github.com/kcrawford/dockutil";
    license = licenses.asl20;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
