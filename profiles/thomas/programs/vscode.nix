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
        mutableExtensionsDir = false;

        profiles = {
          default = {
            enableUpdateCheck = false;
            enableExtensionUpdateCheck = false;

            extensions = with pkgs.vscode-extensions; [
              bbenoist.nix
              bradlc.vscode-tailwindcss
              continue.continue
              dracula-theme.theme-dracula
              dzhavat.bracket-pair-toggler
              editorconfig.editorconfig
              github.vscode-github-actions
              golang.go
              Grafana.vscode-jsonnet
              hashicorp.terraform
              meezilla.json
              mikestead.dotenv
              ms-azuretools.vscode-docker
              ms-kubernetes-tools.vscode-kubernetes-tools
              ms-python.python
              ms-vscode-remote.remote-containers
              ms-vscode-remote.remote-ssh
              ms-vscode.makefile-tools
              naumovs.color-highlight
              redhat.vscode-yaml
              signageos.signageos-vscode-sops
              Vue.volar
            ];

            userSettings = {
              "workbench.colorTheme" = "Dracula";
              "workbench.startupEditor" = "none";

              "redhat.telemetry.enabled" = true;
              "git.enableSmartCommit" = true;

              "search.followSymlinks" = false;

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

              "tailwindCSS.files.exclude" = [
                "**/.devenv/**"
                "**/.direnv/**"
                "**/.git/**"
                "**/.hg/**"
                "**/.svn/**"
                "**/node_modules/**"
              ];
            };
          };
        };
      };
    };
  };
}
