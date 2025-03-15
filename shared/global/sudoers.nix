{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

{
  config = {
    environment = {
      etc = {
        "sudoers.d/admin" = {
          text = ''
            %admin ALL=(ALL) NOPASSWD:ALL
          '';
        };
      };
    };
  };
}
