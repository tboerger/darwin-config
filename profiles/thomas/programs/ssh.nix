{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

let
  cfg = config.profile.programs.ssh;

in
{
  options = {
    profile = {
      programs = {
        ssh = {
          enable = mkEnableOption "SSH" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      ssh = {
        enable = true;
        addKeysToAgent = "yes";
        forwardAgent = true;

        includes = [
          "~/.orbstack/ssh/config"
        ];

        matchBlocks = {
          "niflheim" = {
            hostname = "niflheim.boerger.ws";
            port = 22;
            user = "thomas";
          };

          "yggdrasil" = {
            hostname = "192.168.1.5";
            port = 22;
            user = "thomas";
          };
          "asgard" = {
            hostname = "192.168.1.10";
            port = 22;
            user = "thomas";
          };
          "utgard" = {
            hostname = "192.168.1.11";
            port = 22;
            user = "thomas";
          };

          "*.cloudopserve.io !jumphost1.cloudpunks.io" = lib.hm.dag.entryAfter [ "jumphost1.cloudpunks.io" ] {
            user = "oper";
            forwardAgent = true;
            proxyJump = "tboerger@jumphost1.cloudpunks.io";
          };
          "*.cloudpunks.io !jumphost1.cloudpunks.io" = lib.hm.dag.entryAfter [ "jumphost1.cloudpunks.io" ] {
            user = "oper";
            forwardAgent = true;
            proxyJump = "tboerger@jumphost1.cloudpunks.io";
          };
          "jumphost1.cloudpunks.io" = {
            user = "tboerger";
            forwardAgent = true;
          };
          "jumphost2.cloudpunks.io" = {
            user = "tboerger";
            forwardAgent = true;
          };
        };
      };
    };
  };
}
