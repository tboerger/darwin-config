{ pkgs, ... }:

{
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
  };

  extensions = with pkgs.vscode-extensions; [
    coenraads.bracket-pair-colorizer-2
    editorconfig.editorconfig
    golang.go
    hashicorp.terraform
    jnoortheen.nix-ide
    mikestead.dotenv
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    #ms-python.python
    ms-python.vscode-pylance
    ms-vscode-remote.remote-ssh
    naumovs.color-highlight
    octref.vetur
    redhat.vscode-yaml
    yzhang.markdown-all-in-one
    zxh404.vscode-proto3
  ];
}
