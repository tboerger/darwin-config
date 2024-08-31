{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.gnupg;

in
{
  options = {
    profile = {
      programs = {
        gnupg = {
          enable = mkEnableOption "GnuPG";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        pinentry_mac
      ];
    };

    programs = {
      gpg = {
        enable = true;
      };
    };
  };
}
