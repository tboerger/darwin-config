{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.yubikey;

in

{
  options = {
    profile = {
      programs = {
        yubikey = {
          enable = mkEnableOption "Yubikey";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      brews = [
        "yubikey-agent"
      ];

      casks = [
        "yubico-authenticator"
        "yubico-yubikey-manager"
      ];
    };
  };
}
