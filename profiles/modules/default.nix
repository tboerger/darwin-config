{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./macos.nix
    ./git.nix
    ./iterm.nix
    ./kya.nix
    ./alfred.nix
    ./blizzard.nix
    ./minecraft.nix
    ./steam.nix
    ./gpg.nix
    ./chrome.nix
    ./franz.nix
    ./teams.nix
    ./slack.nix
    ./mattermost.nix
    ./discord.nix
    ./signal.nix
    ./clickup.nix
    ./deezer.nix
    ./rectangle.nix
    ./hammerspoon.nix
  ];

  my = {
    modules = {
      macos = {
        enable = true;
      };

      git = {
        enable = true;
      };

      iterm = {
        enable = true;
      };

      kya = {
        enable = true;
      };

      alfred = {
        enable = true;
      };

      blizzard = {
        enable = true;
      };

      minecraft = {
        enable = true;
      };

      steam = {
        enable = true;
      };

      gpg = {
        enable = true;
      };

      chrome = {
        enable = true;
      };

      franz = {
        enable = true;
      };

      teams = {
        enable = true;
      };

      slack = {
        enable = false;
      };

      mattermost = {
        enable = true;
      };

      discord = {
        enable = true;
      };

      signal = {
        enable = true;
      };

      clickup = {
        enable = true;
      };

      deezer = {
        enable = true;
      };

      rectangle = {
        enable = true;
      };

      hammerspoon = {
        enable = true;
      };
    };
  };
}
