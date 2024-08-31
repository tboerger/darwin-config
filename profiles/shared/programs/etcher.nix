{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.etcher;

in

{
  options = {
    profile = {
      programs = {
        etcher = {
          enable = mkEnableOption "Etcher";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "balenaetcher"
      ];
    };
  };
}
