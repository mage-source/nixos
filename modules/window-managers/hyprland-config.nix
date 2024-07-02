{ lib, config, pkgs, inputs, ... }:

{

  options = {
    alacritty-config.enable = lib.mkEnableOption "enable user module";  
  };


  config = lib.mkIf config.alacritty-config.enable {

    programs.hyprland = {

      enable = true;

      package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    };    

  };

}
