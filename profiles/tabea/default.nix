{ pkgs, inputs, system, ... }:

let
  username = "adrian";

in

{
  users = {
    users = {
      "${username}" = {
        description = "Tabea Boerger";
        isNormalUser = true;
        shell = pkgs.zsh;
        hashedPassword = "$6$yuwsoikF5utqohar$fdcvq0iXdmiioiRyBGeVZICzQm4nKlv6.pj9AWh13VRCsE07dN9StDnXV0aslIBb0SWRFC4dY5Um2MYiAMfmH0";

        home =
          if pkgs.stdenv.isDarwin then
            "/Users/${username}"
          else
            "/home/${username}";
      };
    };
  };

  home-manager.users."${username}" = { config, ... }: {

  };
}
