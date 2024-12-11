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
        "bartender"
        "battle-net"
        "bleunlock"
        "citrix-workspace"
        "clickup"
        "clockify"
        "curseforge"
        "deezer"
        "discord"
        "element"
        "ferdium"
        "firefox"
        "gimp"
        "google-chrome"
        "hammerspoon"
        "iterm2"
        "joplin"
        "keepingyouawake"
        "macdown"
        "mattermost"
        "microsoft-auto-update"
        "microsoft-office"
        "microsoft-remote-desktop"
        "microsoft-teams"
        "nextcloud"
        "obs"
        "orbstack"
        "prismlauncher"
        "rectangle"
        "rocket-chat"
        "rustdesk"
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
        "whatsapp"
      ];

      brews = [
        "mas"
      ];

      masApps = {
        "Adblock für Safari" = 1402042596;
        "Brother iPrint&Scan" = 1193539993;
        "Display Maid" = 450063525;
        "LastPass Password Manager" = 926036361;
        "LimeChat" = 414030210;
        "Parallels Desktop" = 1085114709;
        "Xcode" = 497799835;
      };
    };
  };
}
