{ pkgs, lib, config, options, ... }:

{
  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
