{ pkgs, ... }:

{
  enable = true;
  font = "DejaVu Sans Mono 14";
  terminal = "alacritty";
  theme = "solarized";

  plugins = [
    pkgs.rofi-calc
  ];

  extraConfig = {
    modi = "drun,run,ssh";
  };
}
