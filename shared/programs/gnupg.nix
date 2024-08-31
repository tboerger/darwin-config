{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    programs = {
      gnupg = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
