{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./macos.nix

    ./acrobat.nix
    ./alfred.nix
    ./appcleaner.nix
    ./authy.nix
    ./bartender.nix
    ./blizzard.nix
    ./chrome.nix
    ./clickup.nix
    ./deezer.nix
    ./discord.nix
    ./docker.nix
    ./element.nix
    ./etcher.nix
    ./franz.nix
    ./git.nix
    ./gpg.nix
    ./hammerspoon.nix
    ./istatmenus.nix
    ./iterm.nix
    ./jabra.nix
    ./kya.nix
    ./lastpass.nix
    ./lens.nix
    ./macdown.nix
    ./mattermost.nix
    ./minecraft.nix
    ./multipass.nix
    ./ngrok.nix
    ./owncloud.nix
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

      acrobat = {
        enable = true;
      };

      alfred = {
        enable = true;
      };

      appcleaner = {
        enable = true;
      };

      authy = {
        enable = true;
      };

      bartender = {
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

      docker = {
        enable = true;
      };

      element = {
        enable = true;
      };

      etcher = {
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

      istatmenus = {
        enable = true;
      };

      iterm = {
        enable = true;
      };

      jabra = {
        enable = true;
      };

      kya = {
        enable = true;
      };

      lastpass = {
        enable = true;
      };

      lens = {
        enable = true;
      };

      macdown = {
        enable = true;
      };

      mattermost = {
        enable = true;
      };

      minecraft = {
        enable = true;
      };

      multipass = {
        enable = true;
      };

      ngrok = {
        enable = true;
      };

      owncloud = {
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
