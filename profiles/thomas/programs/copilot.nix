{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

let
  cfg = config.profile.programs.copilot;

in
{
  options = {
    profile = {
      programs = {
        copilot = {
          enable = mkEnableOption "Copilot" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        bash-language-server
        gopls
        typescript-language-server
        vue-language-server
        yaml-language-server
      ];

      file = {
        ".copilot/lsp-config.json" = {
          text = ''
            {
              "lspServers": {
                "go": {
                  "command": "gopls",
                  "fileExtensions": {
                    ".go": "go"
                  }
                },
                "typescript": {
                  "command": "typescript-language-server",
                  "args": ["--stdio"],
                  "fileExtensions": {
                    ".ts": "typescript",
                    ".tsx": "typescript"
                  }
                },
                "yaml": {
                  "command": "yaml-language-server",
                  "args": ["--stdio"],
                  "fileExtensions": {
                    ".yaml": "yaml",
                    ".yml": "yaml"
                  }
                },
                "vue": {
                  "command": "vue-language-server",
                  "args": ["--stdio"],
                  "fileExtensions": {
                    ".vue": "vue"
                  }
                },
                "bash": {
                  "command": "bash-language-server",
                  "args": ["start"],
                  "fileExtensions": {
                    ".sh": "shellscript",
                    ".bash": "shellscript"
                  }
                }
              }
            }
          '';
        };
      };
    };
  };
}
