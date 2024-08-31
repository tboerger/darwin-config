{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./dircolors.nix
    ./direnv.nix
    ./fzf.nix
    ./general.nix
    ./lsd.nix
    ./neovim.nix
    ./programs.nix
    ./readline.nix
    ./starship.nix
    ./tmux.nix
  ];
}
