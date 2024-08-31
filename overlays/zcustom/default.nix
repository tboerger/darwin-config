{ stdenv }:

stdenv.mkDerivation rec {
  name = "zcustom";
  src = ./src;
  phases = [ "installPhase" ];
  installPhase = ''
    install -Dm0444 $src/plugins/tfenv/tfenv.plugin.zsh --target-directory=$out/plugins/tfenv
    install -Dm0444 $src/themes/tboerger.zsh-theme --target-directory=$out/themes
  '';
}
