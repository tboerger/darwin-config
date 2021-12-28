{ pkgs, ... }:

{
  imports = [

  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
