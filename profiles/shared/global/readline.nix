{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  programs = {
    readline = {
      enable = true;

      bindings = {
        "\e[5~" = "history-search-backward";
        "\e[6~" = "history-search-forward";
      };
    };
  };
}
