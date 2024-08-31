{ pkgs, lib, config, options, ... }:

{
  imports = [
    # ./act.nix
    # ./alfred.nix
    # ./alttab.nix
    # ./appcleaner.nix
    # ./browser.nix
    # ./chat.nix
    # ./clouds.nix
    # ./develop.nix
    # ./docker.nix
    # ./etcher.nix
    # ./gaming.nix
    # ./gnupg.nix
    # ./golang.nix
    # ./graphics.nix
    # ./hammerspoon.nix
    # ./ice.nix
    # ./itsycal.nix
    # ./joplin.nix
    # ./kube.nix
    # ./kya.nix
    # ./macdown.nix
    # ./music.nix
    # ./nextcloud.nix
    # ./ngrok.nix
    # ./office.nix
    # ./onlyswitch.nix
    # ./password.nix
    # ./rectangle.nix
    # ./stats.nix
    # ./streaming.nix
    # ./terminal.nix
    # ./utm.nix
    # ./work.nix
    # ./yubikey.nix
  ];

  options = with lib; {
    profile = {
      programs = { };
    };
  };
}
