{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "chnum";

    networkmanager = {
      enable = true;
    };
  };
}
