{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  programs = {
    dircolors = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        "COLORTERM" = "?*";
        "RESET" = "0";
        "DIR" = "01;38;2;189;147;249";
        "LINK" = "01;38;2;139;233;253";
        "MULTIHARDLINK" = "00";
        "FIFO" = "48;2;33;34;44;38;2;241;250;140";
        "SOCK" = "01;38;2;255;121;198";
        "DOOR" = "01;38;2;255;121;198";
        "BLK" = "48;2;33;34;44;38;2;241;250;140;01";
        "CHR" = "48;2;33;34;44;38;2;241;250;140;01";
        "ORPHAN" = "48;2;33;34;44;38;2;255;85;85;01";
        "MISSING" = "00";
        "SETUID" = "38;2;248;248;242;48;2;255;85;85";
        "SETGID" = "38;2;33;34;44;48;2;241;250;140";
        "CAPABILITY" = "00";
        "STICKY_OTHER_WRITABLE" = "38;2;33;34;44;48;2;80;250;123";
        "OTHER_WRITABLE" = "38;2;189;147;249;48;2;80;250;123";
        "STICKY" = "38;2;248;248;242;48;2;189;147;249";
        "EXEC" = "01;38;2;80;250;123";
        ".7z" = "01;38;2;255;85;85";
        ".ace" = "01;38;2;255;85;85";
        ".alz" = "01;38;2;255;85;85";
        ".apk" = "01;38;2;255;85;85";
        ".arc" = "01;38;2;255;85;85";
        ".arj" = "01;38;2;255;85;85";
        ".bz" = "01;38;2;255;85;85";
        ".bz2" = "01;38;2;255;85;85";
        ".cab" = "01;38;2;255;85;85";
        ".cpio" = "01;38;2;255;85;85";
        ".crate" = "01;38;2;255;85;85";
        ".deb" = "01;38;2;255;85;85";
        ".drpm" = "01;38;2;255;85;85";
        ".dwm" = "01;38;2;255;85;85";
        ".dz" = "01;38;2;255;85;85";
        ".ear" = "01;38;2;255;85;85";
        ".egg" = "01;38;2;255;85;85";
        ".esd" = "01;38;2;255;85;85";
        ".gz" = "01;38;2;255;85;85";
        ".jar" = "01;38;2;255;85;85";
        ".lha" = "01;38;2;255;85;85";
        ".lrz" = "01;38;2;255;85;85";
        ".lz" = "01;38;2;255;85;85";
        ".lz4" = "01;38;2;255;85;85";
        ".lzh" = "01;38;2;255;85;85";
        ".lzma" = "01;38;2;255;85;85";
        ".lzo" = "01;38;2;255;85;85";
        ".pyz" = "01;38;2;255;85;85";
        ".rar" = "01;38;2;255;85;85";
        ".rpm" = "01;38;2;255;85;85";
        ".rz" = "01;38;2;255;85;85";
        ".sar" = "01;38;2;255;85;85";
        ".swm" = "01;38;2;255;85;85";
        ".t7z" = "01;38;2;255;85;85";
        ".tar" = "01;38;2;255;85;85";
        ".taz" = "01;38;2;255;85;85";
        ".tbz" = "01;38;2;255;85;85";
        ".tbz2" = "01;38;2;255;85;85";
        ".tgz" = "01;38;2;255;85;85";
        ".tlz" = "01;38;2;255;85;85";
        ".txz" = "01;38;2;255;85;85";
        ".tz" = "01;38;2;255;85;85";
        ".tzo" = "01;38;2;255;85;85";
        ".tzst" = "01;38;2;255;85;85";
        ".udeb" = "01;38;2;255;85;85";
        ".war" = "01;38;2;255;85;85";
        ".whl" = "01;38;2;255;85;85";
        ".wim" = "01;38;2;255;85;85";
        ".xz" = "01;38;2;255;85;85";
        ".z" = "01;38;2;255;85;85";
        ".zip" = "01;38;2;255;85;85";
        ".zoo" = "01;38;2;255;85;85";
        ".zst" = "01;38;2;255;85;85";
        ".avif" = "01;38;2;255;121;198";
        ".jpg" = "01;38;2;255;121;198";
        ".jpeg" = "01;38;2;255;121;198";
        ".mjpg" = "01;38;2;255;121;198";
        ".mjpeg" = "01;38;2;255;121;198";
        ".gif" = "01;38;2;255;121;198";
        ".bmp" = "01;38;2;255;121;198";
        ".pbm" = "01;38;2;255;121;198";
        ".pgm" = "01;38;2;255;121;198";
        ".ppm" = "01;38;2;255;121;198";
        ".tga" = "01;38;2;255;121;198";
        ".xbm" = "01;38;2;255;121;198";
        ".xpm" = "01;38;2;255;121;198";
        ".tif" = "01;38;2;255;121;198";
        ".tiff" = "01;38;2;255;121;198";
        ".png" = "01;38;2;255;121;198";
        ".svg" = "01;38;2;255;121;198";
        ".svgz" = "01;38;2;255;121;198";
        ".mng" = "01;38;2;255;121;198";
        ".pcx" = "01;38;2;255;121;198";
        ".mov" = "01;38;2;255;121;198";
        ".mpg" = "01;38;2;255;121;198";
        ".mpeg" = "01;38;2;255;121;198";
        ".m2v" = "01;38;2;255;121;198";
        ".mkv" = "01;38;2;255;121;198";
        ".webm" = "01;38;2;255;121;198";
        ".webp" = "01;38;2;255;121;198";
        ".ogm" = "01;38;2;255;121;198";
        ".mp4" = "01;38;2;255;121;198";
        ".m4v" = "01;38;2;255;121;198";
        ".mp4v" = "01;38;2;255;121;198";
        ".vob" = "01;38;2;255;121;198";
        ".qt" = "01;38;2;255;121;198";
        ".nuv" = "01;38;2;255;121;198";
        ".wmv" = "01;38;2;255;121;198";
        ".asf" = "01;38;2;255;121;198";
        ".rm" = "01;38;2;255;121;198";
        ".rmvb" = "01;38;2;255;121;198";
        ".flc" = "01;38;2;255;121;198";
        ".avi" = "01;38;2;255;121;198";
        ".fli" = "01;38;2;255;121;198";
        ".flv" = "01;38;2;255;121;198";
        ".gl" = "01;38;2;255;121;198";
        ".dl" = "01;38;2;255;121;198";
        ".xcf" = "01;38;2;255;121;198";
        ".xwd" = "01;38;2;255;121;198";
        ".yuv" = "01;38;2;255;121;198";
        ".cgm" = "01;38;2;255;121;198";
        ".emf" = "01;38;2;255;121;198";
        ".ogv" = "01;38;2;255;121;198";
        ".ogx" = "01;38;2;255;121;198";
        ".aac" = "00;38;2;139;233;253";
        ".au" = "00;38;2;139;233;253";
        ".flac" = "00;38;2;139;233;253";
        ".m4a" = "00;38;2;139;233;253";
        ".mid" = "00;38;2;139;233;253";
        ".midi" = "00;38;2;139;233;253";
        ".mka" = "00;38;2;139;233;253";
        ".mp3" = "00;38;2;139;233;253";
        ".mpc" = "00;38;2;139;233;253";
        ".ogg" = "00;38;2;139;233;253";
        ".ra" = "00;38;2;139;233;253";
        ".wav" = "00;38;2;139;233;253";
        ".oga" = "00;38;2;139;233;253";
        ".opus" = "00;38;2;139;233;253";
        ".spx" = "00;38;2;139;233;253";
        ".xspf" = "00;38;2;139;233;253";
        "*~" = "00;38;2;98;114;164";
        "*#" = "00;38;2;98;114;164";
        ".bak" = "00;38;2;98;114;164";
        ".crdownload" = "00;38;2;98;114;164";
        ".dpkg-dist" = "00;38;2;98;114;164";
        ".dpkg-new" = "00;38;2;98;114;164";
        ".dpkg-old" = "00;38;2;98;114;164";
        ".dpkg-tmp" = "00;38;2;98;114;164";
        ".old" = "00;38;2;98;114;164";
        ".orig" = "00;38;2;98;114;164";
        ".part" = "00;38;2;98;114;164";
        ".rej" = "00;38;2;98;114;164";
        ".rpmnew" = "00;38;2;98;114;164";
        ".rpmorig" = "00;38;2;98;114;164";
        ".rpmsave" = "00;38;2;98;114;164";
        ".swp" = "00;38;2;98;114;164";
        ".tmp" = "00;38;2;98;114;164";
        ".ucf-dist" = "00;38;2;98;114;164";
        ".ucf-new" = "00;38;2;98;114;164";
        ".ucf-old" = "00;38;2;98;114;164";
      };
    };
  };
}
