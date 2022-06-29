{ pkgs, ... }:

{
  enable = true;
  package = pkgs.go_1_18;
  goPath = "Golang";
  goBin = "Golang/bin";

  # add delve to system packages
}
