{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;

    fontDir = {
      enable = true;
    };

    fonts = with pkgs; [
      corefonts
      fira-code
      font-awesome
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-extra
      roboto
      siji
    ];
  };
}
