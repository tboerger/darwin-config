{ pkgs, ... }:

{
  enable = true;
  font = "DejaVu Sans Mono 14";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  theme = "solarized";

  plugins = [
    pkgs.rofi-calc
  ];

  extraConfig = {
    modi = "drun,run,ssh";
  };
}
