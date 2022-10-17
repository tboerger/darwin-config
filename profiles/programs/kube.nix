{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.kube;

in
{
  options = {
    profile = {
      programs = {
        kube = {
          enable = mkEnableOption "Kube" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users."${config.profile.username}" = { config, ... }: {
      home = {
        sessionPath = [ "$HOME/.krew/bin" ];
      };
    };

    environment = {
      systemPackages = with pkgs; [
        argocd
        chart-testing
        clusterctl
        helm-docs
        jsonnet
        jsonnet-bundler
        k9s
        kind
        krew
        kubectl
        kubectx
        kubernetes-helm
        kustomize
        kustomize-sops
        sonobuoy
        stern
        yamale
      ];
    };
  };
}
