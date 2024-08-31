{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    environment = {
      systemPackages = with pkgs; [
        lazydocker
        pwgen
      ];
    };

    homebrew = {
      taps = [
        "webhippie/webhippie"
        "homebrew/cask-versions"
      ];

      casks = [
        "1password"
        "alfred"
        "alt-tab"
        "appcleaner"
        "balenaetcher"
        "battle-net"
        "citrix-workspace"
        "clickup"
        "clockify"
        "curseforge"
        "deezer"
        "discord"
        "docker"
        "element"
        "ferdium"
        "firefox"
        "gimp"
        "google-chrome"
        "hammerspoon"
        "iterm2"
        "itsycal"
        "joplin"
        "jordanbaird-ice"
        "keepingyouawake"
        "lastpass"
        "macdown"
        "mattermost"
        "microsoft-office"
        "microsoft-teams"
        "multimc"
        "nextcloud"
        "obs"
        "only-switch"
        "prismlauncher"
        "rectangle"
        "rocket-chat"
        "signal"
        "skype"
        "slack"
        "stats"
        "steam"
        "telegram"
        "temurin"
        "temurin8"
        "utm"
        "wezterm"
        "whatsapp"
        "yubico-authenticator"
        "yubico-yubikey-manager"
      ];

      brews = [
        "mcrcon"
        "yubikey-agent"
      ];
    };
  };
}
