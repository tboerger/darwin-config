{
  pkgs,
  lib,
  config,
  options,
  ...
}:

{
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = true;

        battery = {
          disabled = true;
        };

        username = {
          format = "[$user]($style) on ";
          style_user = "bold #bd93f9";
        };

        directory = {
          style = "bold #50fa7b";
          truncation_length = 5;
          truncate_to_repo = false;
          truncation_symbol = "…/";
        };

        aws = {
          style = "bold #ffb86c";
        };

        cmd_duration = {
          style = "bold #f1fa8c";
        };

        hostname = {
          style = "bold #ff5555";
        };

        git_branch = {
          style = "bold #ff79c6";
        };

        git_status = {
          style = "bold #ff5555";
        };

        character = {
          success_symbol = "[❯](bold #f8f8f2)";
          error_symbol = "[❯](bold #ff5555)";
        };
      };
    };
  };
}
