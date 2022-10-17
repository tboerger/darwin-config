{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.iterm;

in

{
  options = {
    profile = {
      programs = {
        iterm = {
          enable = mkEnableOption "iTerm" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "iterm2"
      ];
    };
  };
}
