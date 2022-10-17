{ pkgs, lib, config, options, ... }:
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
    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        ssh = {
          enable = true;

          matchBlocks = {
            "midgard" = {
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

            "asbru" = {
              hostname = "asbru.webhippie.de";
              port = 22;
              user = "root";
              forwardAgent = true;
            };

            "*.cloudpunks.io !jumphost*.cloudpunks.io" = {
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
  };
}
