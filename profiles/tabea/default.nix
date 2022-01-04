{ pkgs, inputs, system, lib, ... }:

let
  username = "tabea";

in

{
  users = {
    users = {
      "${username}" = {
        description = "Tabea Boerger";
        shell = pkgs.zsh;

        home =
          if pkgs.stdenv.isDarwin then
            "/Users/${username}"
          else
            "/home/${username}";
      } // (lib.mkIf pkgs.stdenv.isLinux {
        isNormalUser = true;
        hashedPassword = "$6$yuwsoikF5utqohar$fdcvq0iXdmiioiRyBGeVZICzQm4nKlv6.pj9AWh13VRCsE07dN9StDnXV0aslIBb0SWRFC4dY5Um2MYiAMfmH0";

        extraGroups = [
          "networkmanager"
          "audio"
          "video"
        ];
      });
    };
  };

  home-manager.users."${username}" = { config, ... }: { };
}
