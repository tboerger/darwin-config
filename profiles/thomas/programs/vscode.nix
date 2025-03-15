{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

let
  cfg = config.profile.programs.vscode;

in
{
  options = {
    profile = {
      programs = {
        vscode = {
          enable = mkEnableOption "Vscode" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      vscode = {
        enable = true;
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        mutableExtensionsDir = false;

        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          bradlc.vscode-tailwindcss
          christian-kohler.npm-intellisense
          dracula-theme.theme-dracula
          dzhavat.bracket-pair-toggler
          editorconfig.editorconfig
          foxundermoon.shell-format
          github.vscode-github-actions
          golang.go
          grafana.vscode-jsonnet
          Grafana.vscode-jsonnet
          hashicorp.terraform
          jnoortheen.nix-ide
          mads-hartmann.bash-ide-vscode
          mikestead.dotenv
          ms-azuretools.vscode-docker
          ms-kubernetes-tools.vscode-kubernetes-tools
          ms-python.python
          ms-vscode-remote.remote-containers
          ms-vscode-remote.remote-ssh
          ms-vscode.makefile-tools
          naumovs.color-highlight
          redhat.vscode-yaml
          shakram02.bash-beautify
          signageos.signageos-vscode-sops
          steoates.autoimport
          timonwong.shellcheck
          Vue.volar
          yzhang.markdown-all-in-one
          zxh404.vscode-proto3
        ];

        userSettings = {
          "workbench.colorTheme" = "Dracula";
          "workbench.startupEditor" = "none";

          "redhat.telemetry.enabled" = true;
          "git.enableSmartCommit" = true;

          "editor.renderControlCharacters" = true;
          "editor.renderWhitespace" = "all";
          "editor.minimap.enabled" = false;

          "editor.rulers" = [
            80
          ];

          "files.insertFinalNewline" = true;
          "files.trimTrailingWhitespace" = true;

          "go.useLanguageServer" = true;
          "go.toolsManagement.autoUpdate" = true;

          "[python]" = {
            "editor.formatOnType" = true;
          };
          "[vue]" = {
            "editor.defaultFormatter" = "Vue.volar";
          };
          "[yaml]" = {
            "editor.defaultFormatter" = "redhat.vscode-yaml";
          };
        };
      };
    };
  };
}
