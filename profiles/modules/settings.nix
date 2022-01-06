{ pkgs, lib, config, options, ... }:

{
  options = with lib; {
    my = {
      username = mkOption {
        type = types.str;
      };
    };
  };
}
