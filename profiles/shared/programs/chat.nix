{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.chat;

in

{
  options = {
    profile = {
      programs = {
        chat = {
          enable = mkEnableOption "Chat";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = [
        "ferdium"

        "discord"
        "element"
        "microsoft-teams"
        "signal"
        "skype"
        "slack"
        "telegram"
        "whatsapp"

        "mattermost"
        "rocket-chat"
      ];
    };
  };
}
