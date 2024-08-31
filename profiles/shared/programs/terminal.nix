{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.terminal;

in

{
  options = {
    profile = {
      programs = {
        terminal = {
          enable = mkEnableOption "Terminal";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "iterm2"
        "wezterm"
      ];
    };
  };
}
