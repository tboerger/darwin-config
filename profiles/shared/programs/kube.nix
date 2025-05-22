{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

let
  cfg = config.profile.programs.kube;

in
{
  options = {
    profile = {
      programs = {
        kube = {
          enable = mkEnableOption "Kube";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      shellAliases = {
        k = "kubectl";
        kunusedrs = "kubectl get replicaset -o jsonpath=\"{ .items[?(@.spec.replicas==0)].metadata.name }\"";
      };

      file = {
        ".local/bin/kubectl-ctx" = {
          source = "${pkgs.kubectx}/bin/kubectx";
          executable = true;
        };
        ".local/bin/kubectl-ns" = {
          source = "${pkgs.kubectx}/bin/kubens";
          executable = true;
        };
        ".local/bin/kubectl-virt" = {
          source = "${pkgs.kubevirt}/bin/virtctl";
          executable = true;
        };
      };

      packages = with pkgs; [
        grafana-loki
        k9s
        khelm
        kind
        ksops
        kubectl
        kubectl-cnpg
        kubectl-get-all
        kubectl-images
        kubectl-ktop
        kubectl-neat
        kubectl-outdated
        kubectl-pexec
        kubectl-realname-diff
        kubectl-rolesum
        kubectl-slice
        kubectl-view-secret
        kubectl-whoami
        kubectx
        kubelogin-oidc
        kubernetes-helm
        kustomize
        stern
      ];
    };
  };
}
