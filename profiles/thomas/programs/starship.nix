{ pkgs, ... }:

{
  enable = true;

  settings = {
    add_newline = true;
    battery = {
      disabled = true;
    };
    directory = {
      truncation_length = 5;
      truncate_to_repo = false;
      truncation_symbol = "…/";
    };
  };
}
