{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./macos.nix

    ./alfred.nix
    ./blizzard.nix
    ./chrome.nix
    ./clickup.nix
    ./deezer.nix
    ./discord.nix
    ./franz.nix
    ./git.nix
    ./gpg.nix
    ./hammerspoon.nix
    ./iterm.nix
    ./kya.nix
    ./mattermost.nix
    ./minecraft.nix
    ./rectangle.nix
    ./signal.nix
    ./slack.nix
    ./steam.nix
    ./teams.nix
  ];

  my = {
    modules = {
      macos = {
        enable = true;
      };

      alfred = {
        enable = true;
      };

      blizzard = {
        enable = true;
      };

      chrome = {
        enable = true;
      };

      clickup = {
        enable = true;
      };

      deezer = {
        enable = true;
      };

      discord = {
        enable = true;
      };

      franz = {
        enable = true;
      };

      git = {
        enable = true;
      };

      gpg = {
        enable = true;
      };

      hammerspoon = {
        enable = true;
      };

      iterm = {
        enable = true;
      };

      kya = {
        enable = true;
      };

      mattermost = {
        enable = true;
      };

      minecraft = {
        enable = true;
      };

      rectangle = {
        enable = true;
      };

      signal = {
        enable = true;
      };

      slack = {
        enable = true;
      };

      steam = {
        enable = true;
      };

      teams = {
        enable = true;
      };
    };
  };
}
