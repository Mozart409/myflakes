{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    # font = "FiraCode";
    themeFile = "kanagawa_dragon";
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
    };
  };
  programs.ghostty = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        lines = 40;
        columns = 120;
        working_directory = "/home/amadeus/code";
        live_config_reload = "true";
        mouse = {
          hide_when_typing = "true";
        };
        font = {
          size = 13;
          normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
          };
        };
      };

    };
  };
}
