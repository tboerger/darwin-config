{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    environment = {
      systemPackages = with pkgs; [
        lazydocker
        m-cli
        mcrcon
        pwgen
      ];
    };

    homebrew = {
      enable = true;

      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "zap";
      };

      taps = [
        "homebrew/cask-versions"
        "homebrew/cask"
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
        "swiftdefaultappsprefpane"
        "telegram"
        "temurin"
        "temurin8"
        "utm"
        "wezterm"
        "whatsapp"
      ];

      brews = [
        "mas"
      ];

      # masApps = {
      #   "Display Maid" = 450063525;
      #   "The Unarchiver" = 425424353;
      #   "Xcode" = 497799835;
      # };
    };
  };
}
