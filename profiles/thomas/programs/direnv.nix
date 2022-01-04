{ pkgs, ... }:

{
  enable = true;
  enableZshIntegration = true;

  nix-direnv = {
    enable = true;
  };
}
