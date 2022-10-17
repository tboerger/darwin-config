{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.latex;

in

{
  options = {
    profile = {
      programs = {
        latex = {
          enable = mkEnableOption "Latex" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      brews = [
        "texlive"
      ];
    };
  };
}
