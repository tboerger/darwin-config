{
  pkgs,
  lib,
  config,
  options,
  ...
}:

let
  lsdPkg = pkgs.lsd.overrideAttrs (_: {
    doCheck = false;
    checkPhase = "true";
    doInstallCheck = false;
  });
in

{
  programs = {
    lsd = {
      enable = true;
      enableZshIntegration = false;
      package = lsdPkg;

      settings = {
        color = {
          when = "always";
          theme = "custom";
        };

        icons = {
          when = "always";
          theme = "fancy";
          separator = " ";
        };

        symlink-arrow = "⇒";
      };

      colors = {
        user = "159";
        group = "231";
        tree-edge = "183";
        permission = {
          read = "183";
          write = "212";
          exec = "159";
          exec-sticky = "159";
          no-access = "120";
        };
        date = {
          hour-old = "146";
          day-old = "103";
          older = "60";
        };
        size = {
          none = "60";
          small = "120";
          medium = "215";
          large = "210";
        };
        inode = {
          valid = "231";
          invalid = "210";
        };
        links = {
          valid = "159";
          invalid = "210";
        };
      };
    };

    zsh.shellAliases = {
      ls = "${lsdPkg}/bin/lsd";
      ll = "${lsdPkg}/bin/lsd -l";
      la = "${lsdPkg}/bin/lsd -A";
      lt = "${lsdPkg}/bin/lsd --tree";
      lla = "${lsdPkg}/bin/lsd -lA";
      llt = "${lsdPkg}/bin/lsd -l --tree";
    };
  };
}
