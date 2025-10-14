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
        enableDefaultConfig = false;

        includes = [
          "~/.orbstack/ssh/config"
        ];

        matchBlocks = {
          "niflheim" = {
            hostname = "niflheim.boerger.ws";
            port = 22;
            user = "thomas";
            addKeysToAgent = "yes";
            forwardAgent = true;
          };

          "yggdrasil" = {
            hostname = "192.168.1.5";
            port = 22;
            user = "thomas";
            addKeysToAgent = "yes";
            forwardAgent = true;
          };
          "asgard" = {
            hostname = "192.168.1.10";
            port = 22;
            user = "thomas";
            addKeysToAgent = "yes";
            forwardAgent = true;
          };
          "utgard" = {
            hostname = "192.168.1.11";
            port = 22;
            user = "thomas";
            addKeysToAgent = "yes";
            forwardAgent = true;
          };

          "jumphost1.cloudpunks.io" = {
            user = "tboerger";
            addKeysToAgent = "yes";
            forwardAgent = true;
          };
          "jumphost2.cloudpunks.io" = {
            user = "tboerger";
            addKeysToAgent = "yes";
            forwardAgent = true;
          };

          "*.cloudopserve.io !jumphost1.cloudpunks.io !jumphost2.cloudpunks.io" =
            lib.hm.dag.entryAfter [ "jumphost1.cloudpunks.io" "jumphost2.cloudpunks.io" ]
              {
                user = "oper";
                addKeysToAgent = "yes";
                forwardAgent = true;
                proxyJump = "tboerger@jumphost1.cloudpunks.io";
              };
          "*.cloudpunks.io !jumphost1.cloudpunks.io !jumphost2.cloudpunks.io" =
            lib.hm.dag.entryAfter [ "jumphost1.cloudpunks.io" "jumphost2.cloudpunks.io" ]
              {
                user = "oper";
                addKeysToAgent = "yes";
                forwardAgent = true;
                proxyJump = "tboerger@jumphost1.cloudpunks.io";
              };
        };
      };
    };
  };
}
