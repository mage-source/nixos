{ lib, config, pkgs, inputs, ... }:

{

  options = {
    alacritty-config.enable = lib.mkEnableOption "enable user module";  
  };


  config = lib.mkIf config.alacritty-config.enable {

    programs.alacritty = {

      enable = true;

      settings = {
        env.TERM = "xterm-256color";
        font = {
          size = 12;
        };
        scrolling.multiplier = 5;
        selection.save_to_clipboard = true;
      };

    };    

  };

}
