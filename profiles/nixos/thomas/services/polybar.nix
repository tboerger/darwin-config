{ pkgs, ... }:

{
  enable = true;
  script = "polybar general &";

  package = pkgs.polybar.override {
    i3Support = true;
    mpdSupport = true;
    iwSupport = true;
    pulseSupport = true;
    githubSupport = true;
  };

  settings = {
    "colors" = {
      background = "#002b36";
      background-alt = "#073642";
      foreground = "#93a1a1";
      foreground-alt = "#eee8d5";
      primary = "#ffb52a";
      secondary = "#e60053";
      alert = "#bd2c40";
      red = "#dc322f";
    };

    "bar/general" = {
      width = "100%";
      height = 43;
      radius = 0;

      fixed-center = true;

      background = "\${colors.background}";
      foreground = "\${colors.foreground}";

      line-size = 3;
      line-color = "#f00";

      border-size = 5;
      border-color = "#000000";

      padding-left = 0;
      padding-right = 2;

      module-margin-left = 1;
      module-margin-right = 2;

      font-0 = "DejaVu Sans Mono:size=14;-1";
      font-1 = "Roboto Regular:size=14;-2";
      font-2 = "FontAwesome:size=14;0";

      modules-left = "i3";
      modules-center = "";
      modules-right = "cpu memory volume wireless wired battery date";

      tray-position = "right";
      tray-padding = 2;
      tray-transparent = false;
      tray-background = "#0063ff";

      wm-restack = "i3";
      scroll-up = "i3wm-wsnext";
      scroll-down = "i3wm-wsprev";
    };

    "module/i3" = {
      type = "internal/i3";
    };

    "module/cpu" = {
      type = "internal/cpu";
      interval = 0.5;
    };

    "module/memory" = {
      type = "internal/memory";
    };

    "module/wireless" = {
      type = "internal/network";
      interval = 1.0;
      interface = "wlp2s0";

      format-connected = "<label-connected>";
      format-connected-underline = "\${colors.foreground}";
      label-connected = "";

      format-disconnected = "<label-disconnected>";
      format-disconnected-underline = "\${colors.foreground}";
      label-disconnected = "";
    };

    "module/wired" = {
      type = "internal/network";
      interval = 1.0;
      interface = "enp0s25";

      format-connected = "<label-connected>";
      format-connected-underline = "\${colors.foreground}";
      label-connected = "";

      format-disconnected = "<label-disconnected>";
      format-disconnected-underline = "\${colors.foreground}";
      label-disconnected = "";
    };

    "module/battery" = {
      type = "internal/battery";
      battery = "CMB1";
      adapter = "ADP1";
      full-at = 98;
    };

    "module/date" = {
      type = "internal/date";

      date = "";
      date-alt = " %Y-%m-%d ";

      time = " %H:%M";
      time-alt = " %H:%M:%S";

      format-prefix = "";
      format-prefix-foreground = "\${colors.foreground-alt}";
      format-underline = "\${colors.foreground}";

      label = "%date%%time%";
    };
  };
}
