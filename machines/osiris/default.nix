{
  imports = [
    ./networking.nix
  ];

  my = {
    modules = {
      steam = {
        enable = false;
      };

      blizzard = {
        enable = false;
      };

      minecraft = {
        enable = false;
      };
    };
  };

  system = {
    stateVersion = 4;
  };
}
