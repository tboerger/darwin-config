{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

let
  cfg = config.profile.programs.github;

in
{
  options = {
    profile = {
      programs = {
        github = {
          enable = mkEnableOption "GitHub" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      gh = {
        enable = true;

        extensions = with pkgs; [
          gh-dash
          gh-markdown-preview
          gh-poi
        ];
      };
      zsh = {
        sessionVariables = {
          GH_TOKEN = "$(cat ${config.home.homeDirectory}/.ghtoken)";
          GITHUB_TOKEN = "$(cat ${config.home.homeDirectory}/.ghtoken)";
        };
      };
    };

    age = {
      secrets = {
        github = {
          file = ../secrets/github.age;
          path = "${config.home.homeDirectory}/.ghtoken";
          mode = "0600";
        };
      };
    };
  };
}
