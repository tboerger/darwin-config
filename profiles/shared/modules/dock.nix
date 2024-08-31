{ pkgs, lib, config, options, ... }:

let
  cfg = config.profile.modules.dock;
in

{
  options = with lib; {
    profile = {
      modules = {
        dock = {
          enable = mkEnableOption ''
            Whether to enable dock module
          '';

          entries = mkOption {
            description = ''
              Entries for the Dock
            '';
            type = with types; listOf (submodule {
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

    system.defaults.dock.largesize = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = ''
        Large size of the icons in the dock.  The default is 64.
      '';
    };

    system.defaults.dock.magnification = mkOption {
      type = types.nullOr types.bool;
      default = null;
      description = ''
        Enable magnification for the icons in the dock.  The default is false.
      '';
    };
  };

  config = with lib; mkIf cfg.enable (
    let
      normalize = path: if hasSuffix ".app" path then path + "/" else path;

      entryURI = path: "file://" + (builtins.replaceStrings
        [ " " "!" "\"" "#" "$" "%" "&" "'" "(" ")" ]
        [ "%20" "%21" "%22" "%23" "%24" "%25" "%26" "%27" "%28" "%29" ]
        (normalize path)
      );

      wantURIs = concatMapStrings
        (entry: "${entryURI entry.path}\n")
        cfg.entries;

      createEntries = concatMapStrings
        (entry: "${pkgs.dockutil}/bin/dockutil --no-restart --add '${entry.path}' --section ${entry.section} ${entry.options}\n")
        cfg.entries;
    in
    {
      environment = {
        systemPackages = with pkgs; [
          dockutil
        ];
      };

      system.activationScripts.postUserActivation.text = ''
        echo >&2 "Setting up dock items..."
        haveURIs="$(${pkgs.dockutil}/bin/dockutil --list | ${pkgs.coreutils}/bin/cut -f2)"
        if ! diff -wu <(echo -n "$haveURIs") <(echo -n '${wantURIs}') >&2; then
          echo >&2 "Resetting dock"
          ${pkgs.dockutil}/bin/dockutil --no-restart --remove all
          ${createEntries}
          killall Dock
        else
          echo >&2 "Dock is how we want it"
        fi
      '';
    }
  );
}
