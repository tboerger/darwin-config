{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

let
  cfg = config.profile.programs.zsh;

in
{
  options = {
    profile = {
      programs = {
        zsh = {
          enable = mkEnableOption "Zsh" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;

        autosuggestion = {
          enable = true;
        };

        syntaxHighlighting = {
          enable = true;
        };

        profileExtra = ''
          [ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh
          [ -r ~/.orbstack/shell/init.zsh ] && source ~/.orbstack/shell/init.zsh
          [ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
        '';

        history = {
          size = 10000000;
          save = 10000000;
          extended = true;
          path = "${config.home.homeDirectory}/.zhistory";
        };

        sessionVariables = {
          EDITOR = "vim";
          PAGER = "less";
          CLICOLOR = "1";
          GREP_COLORS = "mt=1;33";
          IGNOREEOF = "1";

          OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES";
        };

        shellAliases = {
          ".." = "cd ..";
          "..." = "cd ../..";

          rgrep = "grep -Rn";
          hgrep = "fc -El 0 | grep";
          history = "fc -l 1";
          sha256sum = "shasum -a 256";
        };

        oh-my-zsh = {
          enable = true;

          plugins = [
            "direnv"
            "encode64"
            "git-prompt"
            "history-substring-search"
            "kube-ps1"
            "rsync"
            "sudo"
            "tmux"
            "transfer"
          ];
        };
      };
    };
  };
}
