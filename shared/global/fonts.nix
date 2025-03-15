{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    fonts = {
      packages = with pkgs; [
        corefonts
        font-awesome
        nerd-fonts.droid-sans-mono
        nerd-fonts.fira-code
        noto-fonts
        noto-fonts-emoji
        noto-fonts-extra
        roboto
        source-code-pro
      ];
    };
  };
}
