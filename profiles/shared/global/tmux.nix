{ pkgs, lib, config, options, ... }:

{
  programs = {
    tmux = {
      enable = true;
      clock24 = true;

      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        {
          plugin = dracula;
          extraConfig = ''
            set -g @dracula-show-battery false
            set -g @dracula-show-powerline true
            set -g @dracula-refresh-rate 10
            set -g @dracula-show-fahrenheit false
            set -g @dracula-show-location false
          '';
        }
      ];

      extraConfig = ''
        set -g mouse off
      '';
    };
  };
}
