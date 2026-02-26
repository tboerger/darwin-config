{
  pkgs,
  lib,
  config,
  options,
  ...
}:
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
    home = {
      packages = with pkgs; [
        hub
        lazygit
      ];

      shellAliases = {
        git = "hub";

        gs = "git status";
        gc = "git commit";
        gp = "git push";
        gl = "git pull";

        status = "git status";
        commit = "git commit";
        push = "git push";
        pull = "git pull";
      };

      file = {
        ".local/bin/git-gh-pages" = {
          executable = true;
          text = ''
            #!/usr/bin/env bash
            set -e

            [ "$1" = "-h" ] && exec sed -ne '/^#/!q;s/.\{1,2\}//;1d;p' < "$0"

            workdir="$(mktemp -d -t gh-pages.XXXXXXXXXX)"
            repo="$1"

            if [[ -z "$repo" ]]; then
              exec sed -ne '/^#/!q;s/.\{1,2\}//;1d;p' < "$0"
              exit 1
            fi

            pushd $workdir >/dev/null
              git init
              git checkout --orphan gh-pages

              touch index.html
              git add index.html

              git commit -m 'chore: initial commit'

              git remote add origin https://github.com/$repo.git
              git push -u origin gh-pages
            popd >/dev/null

            rm -rf $workdir
          '';
        };
      };
    };

    programs = {
      git = {
        enable = true;

        signing = {
          key = "0xF630596501026DB5";
          signByDefault = true;
        };

        settings = {
          user = {
            name = "Thomas Boerger";
            email = "thomas@webhippie.de";
          };

          alias = {
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

            branch-cleanup = "!git branch | grep -v \"$(git branch --show-current)\" | grep -v \"$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's|^refs/remotes/origin/||')\" | xargs -r git branch -D";

            unstage = "reset HEAD";
            uncommit = "reset --soft HEAD^";

            stag = "tag -s";
            tags = "tag -l";
            branches = "branch -a";
            remotes = "remote -v";

            fap = "fetch --all --prune";

            sma = "submodule add";
            smi = "submodule init";
            smu = "submodule update --init --recursive";

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

          color = {
            ui = "auto";
            branch = "auto";
            diff = "auto";
            interactive = "auto";
            status = "auto";
          };
          core = {
            quotepath = false;
          };
          diff = {
            algorithm = "patience";
          };
          format = {
            signoff = true;
          };
          github = {
            user = "tboerger";
          };
          init = {
            defaultBranch = "master";
          };
          merge = {
            log = true;
          };
          pager = {
            branch = false;
            tag = false;
          };
          pull = {
            rebase = true;
          };
          push = {
            default = "simple";
            autoSetupRemote = true;
          };
        };

        ignores = [
          ".DS_Store"
          ".envrc"
          ".vscode"
          ".idea"
        ];

        lfs = {
          enable = true;
        };
      };
    };
  };
}
