{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.git;

in
{
  options = {
    profile = {
      programs = {
        git = {
          enable = mkEnableOption "Git" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home-manager.users."${config.profile.username}" = { config, ... }: {
      programs = {
        git = {
          enable = true;

          userName = "Thomas Boerger";
          userEmail = "thomas@webhippie.de";

          signing = {
            key = "0xF630596501026DB5";
            signByDefault = true;
          };

          aliases = {
            ci = "commit";
            di = "diff";
            st = "status";
            co = "checkout";
            br = "branch";
            pu = "push";
            pl = "pull";
            cat = "cat-file -p";
            rc = "rebase --continue";
            rs = "rebase --skip";

            unstage = "reset HEAD";
            uncommit = "reset --soft HEAD^";

            stag = "tag -s";
            tags = "tag -l";
            branches = "branch -a";
            remotes = "remote -v";

            fap = "fetch --all --prune";

            hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";

            amend = "commit --amend -C HEAD";

            assume = "!git update-index --assume-unchanged";
            unassume = "!git update-index --no-assume-unchanged";
            assumed = "!git ls-files -v | grep ^h | cut -c 3-";

            snapshot = "!git stash save \"snapshot: $(date)\" && git stash apply \"stash@{0}\"";
            snapshots = "!git stash list --grep snapshot";

            conflicts = "!git ls-files -u | awk '{print $4}' | sort -u";
            resolve = "!git conflicts | xargs git add";
          };

          ignores = [
            ".DS_Store"
            ".envrc"
            ".vscode"
          ];

          extraConfig = {
            core = {
              quotepath = false;
            };
            init = {
              defaultBranch = "master";
            };
            github = {
              user = "tboerger";
            };
            pager = {
              branch = false;
              tag = false;
            };
            push = {
              default = "simple";
            };
            format = {
              signoff = true;
            };
          };

          lfs = {
            enable = true;
          };
        };
      };
    };
  };
}
