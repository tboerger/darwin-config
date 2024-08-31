{ pkgs, lib, config, options, ... }:

{
  programs = {
    tmux = {
      enable = true;
      clock24 = true;

      tmuxinator = {
        enable = true;
      };
    };
  };
}
