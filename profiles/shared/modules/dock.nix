{
  pkgs,
  lib,
  config,
  options,
  ...
}:

let
  cfg = config.profile.programs.dock;
in

{
  options = with lib; {
    profile = {
      programs = {
        dock = {
          enable = mkEnableOption ''
            Whether to enable dock module
          '';

          entries = mkOption {
            description = ''
              Entries for the Dock
            '';
            type =
              with types;
              listOf (submodule {
                options = {
                  path = lib.mkOption {
                    type = str;
                  };

                  section = lib.mkOption {
                    type = str;
                    default = "apps";
                  };

                  options = lib.mkOption {
                    type = str;
                    default = "";
                  };
                };
              });
          };
        };
      };
    };
  };

  config =
    with lib;
    mkIf cfg.enable (
      let
        normalize = path: if hasSuffix ".app" path then path + "/" else path;

        entryURI =
          path:
          "file://"
          + (builtins.replaceStrings
            [
              " "
              "!"
              "\""
              "#"
              "$"
              "%"
              "&"
              "'"
              "("
              ")"
            ]
            [
              "%20"
              "%21"
              "%22"
              "%23"
              "%24"
              "%25"
              "%26"
              "%27"
              "%28"
              "%29"
            ]
            (normalize path)
          );

        wantURIs = concatMapStrings (entry: "${entryURI entry.path}\n") cfg.entries;

        createEntries = concatMapStrings (
          entry:
          "${pkgs.dockutil}/bin/dockutil --no-restart --add '${entry.path}' --section ${entry.section} ${entry.options}\n"
        ) cfg.entries;
      in
      {
        home = {
          activation = {
            updateDockEntries = ''
              echo >&2 "Setting up dock items..."
              haveURIs="$(${pkgs.dockutil}/bin/dockutil --list | ${pkgs.coreutils}/bin/cut -f2)"
              if ! diff -wu <(echo -n "$haveURIs") <(echo -n '${wantURIs}') >&2; then
                echo >&2 "Resetting dock"
                ${pkgs.dockutil}/bin/dockutil --no-restart --remove all
                ${createEntries}
                /usr/bin/killall Dock
              else
                echo >&2 "Dock is how we want it"
              fi
            '';
          };
        };
      }
    );
}
