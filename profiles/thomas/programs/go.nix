{ pkgs, ... }:

{
  enable = true;
  package = pkgs.go_1_17;
  goPath = "Golang";
  goBin = "Golang/bin";
}
