{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./alfred.nix
    ./alttab.nix
    ./appcleaner.nix
    ./authy.nix
    ./bartender.nix
    ./blizzard.nix
    ./chrome.nix
    ./clickup.nix
    ./clockify.nix
    ./cloud.nix
    ./deezer.nix
    ./dircolors.nix
    ./direnv.nix
    ./discord.nix
    ./docker.nix
    ./element.nix
    ./etcher.nix
    ./franz.nix
    ./fzf.nix
    ./gpg.nix
    ./hammerspoon.nix
    ./iterm.nix
    ./itsycal.nix
    ./jabra.nix
    ./kube.nix
    ./kya.nix
    ./lastpass.nix
    ./latex.nix
    ./lens.nix
    ./lsd.nix
    ./macdown.nix
    ./mattermost.nix
    ./minecraft.nix
    ./ngrok.nix
    ./office.nix
    ./onlyswitch.nix
    ./owncloud.nix
    ./rambox.nix
    ./readline.nix
    ./rectangle.nix
    ./rocketchat.nix
    ./signal.nix
    ./slack.nix
    ./starship.nix
    ./stats.nix
    ./steam.nix
    ./teams.nix
  ];

  options = with lib; {
    profile = {
      programs = { };
    };
  };
}
