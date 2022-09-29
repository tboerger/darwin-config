{ pkgs, ... }:

{
  enable = true;
  package = pkgs.unstable.go_1_19;
  goPath = "Golang";
  goBin = "Golang/bin";

  # add delve to system packages
}
