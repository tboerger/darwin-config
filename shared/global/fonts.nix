{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    fonts = {
      packages = with pkgs; [
        corefonts
        fira-code-nerdfont
        font-awesome
        nerdfonts
        noto-fonts
        noto-fonts-emoji
        noto-fonts-extra
        roboto
        source-code-pro
      ];
    };
  };
}
