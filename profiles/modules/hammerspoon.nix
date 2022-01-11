{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.hammerspoon;

in

{
  options = with lib; {
    my = {
      modules = {
        hammerspoon = {
          enable = mkEnableOption ''
            Whether to enable hammerspoon module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "hammerspoon"
        ];
      };

      home-manager.users."${config.my.username}" = { config, ... }: {
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
    };
}
