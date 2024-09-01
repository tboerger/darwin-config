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

      ];

      casks = [
        "1password"
        "alfred"
        "alt-tab"
        "appcleaner"
        "balenaetcher"
        "battle-net"
        "ccmenu"
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
        "microsoft-remote-desktop"
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
        "tailscale"
        "telegram"
        "temurin"
        "temurin@8"
        "the-unarchiver"
        "utm"
        "wezterm"
        "whatsapp"
      ];

      brews = [
        "mas"
      ];

      # masApps = {
      #   "Brother iPrint&Scan" = ;
      #   "Adblock für Safari" = ;
      #   "Markoff" = ;
      #   "Limechat" = ;
      #   "Display Maid" = 450063525;
      #   "Xcode" = 497799835;
      # };
    };
  };
}
