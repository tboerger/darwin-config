{ pkgs, lib, config, options, ... }:

{
  options = with lib; {
    my = {
      modules = { };
    };
  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
