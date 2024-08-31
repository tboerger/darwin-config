{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    programs = {
      gnupg = {
        agent = {
          enable = true;
          enableSSHSupport = true;
        };
      };
    };
  };
}
