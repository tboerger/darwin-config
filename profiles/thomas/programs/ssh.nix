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

        settings = {
          "Host niflheim" = {
            Hostname = "niflheim.boerger.ws";
            Port = 22;
            User = "thomas";
            AddKeysToAgent = "yes";
            ForwardAgent = true;
          };

          "Host yggdrasil" = {
            Hostname = "192.168.1.5";
            Port = 22;
            User = "thomas";
            AddKeysToAgent = "yes";
            ForwardAgent = true;
          };
          "Host asgard" = {
            Hostname = "192.168.1.10";
            Port = 22;
            User = "thomas";
            AddKeysToAgent = "yes";
            ForwardAgent = true;
          };
          "Host utgard" = {
            Hostname = "192.168.1.11";
            Port = 22;
            User = "thomas";
            AddKeysToAgent = "yes";
            ForwardAgent = true;
          };

          "Host jumphost1.cloudpunks.io" = {
            User = "tboerger";
            AddKeysToAgent = "yes";
            ForwardAgent = true;
          };
          "Host jumphost2.cloudpunks.io" = {
            User = "tboerger";
            AddKeysToAgent = "yes";
            ForwardAgent = true;
          };

          "Host *.cloudopserve.io !jumphost1.cloudpunks.io !jumphost2.cloudpunks.io" =
            lib.hm.dag.entryAfter [ "Host jumphost1.cloudpunks.io" "Host jumphost2.cloudpunks.io" ]
              {
                User = "oper";
                AddKeysToAgent = "yes";
                ForwardAgent = true;
                ProxyJump = "tboerger@jumphost1.cloudpunks.io";
              };
          "Host *.cloudpunks.io !jumphost1.cloudpunks.io !jumphost2.cloudpunks.io" =
            lib.hm.dag.entryAfter [ "Host jumphost1.cloudpunks.io" "Host jumphost2.cloudpunks.io" ]
              {
                User = "oper";
                AddKeysToAgent = "yes";
                ForwardAgent = true;
                ProxyJump = "tboerger@jumphost1.cloudpunks.io";
              };
        };
      };
    };
  };
}
