{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.lens;

in

{
  options = {
    profile = {
      programs = {
        lens = {
          enable = mkEnableOption "Lens" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "lens"
      ];
    };
  };
}
