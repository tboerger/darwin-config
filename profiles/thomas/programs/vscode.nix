{ pkgs, lib, config, options, ... }:
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
    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        vscode = {
          enable = true;
          package = pkgs.vscode;

          userSettings = {
            "editor.renderControlCharacters" = true;
            "editor.renderWhitespace" = "all";
            "editor.rulers" = [ 80 ];
            "files.insertFinalNewline" = true;
            "files.trimTrailingWhitespace" = true;
            "go.useLanguageServer" = true;
            "workbench.colorTheme" = "Solarized Dark";
            "workbench.startupEditor" = "none";
            "[vue]" = {
              "editor.defaultFormatter" = "octref.vetur";
            };
          };

          extensions = with pkgs.vscode-extensions; [
            dzhavat.bracket-pair-toggler
            editorconfig.editorconfig
            golang.go
            hashicorp.terraform
            jnoortheen.nix-ide
            mikestead.dotenv
            ms-azuretools.vscode-docker
            ms-kubernetes-tools.vscode-kubernetes-tools
            ms-python.python
            ms-python.vscode-pylance
            ms-vscode-remote.remote-ssh
            naumovs.color-highlight
            octref.vetur
            redhat.vscode-yaml
            yzhang.markdown-all-in-one
            zxh404.vscode-proto3
          ];
        };
      };
    };
  };
}
