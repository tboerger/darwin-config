{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.kya;

in

{
  options = {
    profile = {
      programs = {
        kya = {
          enable = mkEnableOption "KeepingYouAwake";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "keepingyouawake"
      ];
    };
  };
}
