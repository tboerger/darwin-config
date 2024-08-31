{ pkgs, lib, config, options, ... }:
with lib;

{
  config = {
    time = {
      timeZone = "Europe/Berlin";
    };
  };
}
