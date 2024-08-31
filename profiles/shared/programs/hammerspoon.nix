{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.hammerspoon;

in

{
  options = {
    profile = {
      programs = {
        hammerspoon = {
          enable = mkEnableOption "Hammerspoon";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      file = {
        ".hammerspoon/init.lua" = {
          executable = true;
          text = ''
            hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
              for _, w in pairs(hs.window.allWindows()) do
                w:maximize()
              end
            end)
          '';
        };
      };
    };
  };
}
