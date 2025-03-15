{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../shared/modules
    ../../shared/global
    ../../shared/programs
    ../../shared/services
  ];

  networking = {
    localHostName = "dagda";
    hostName = "dagda";
    computerName = "dagda";
  };

  system = {
    stateVersion = 4;
  };
}
