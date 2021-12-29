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
    modi = "window,drun,ssh";
  };
}
