{ lib, config, pkgs, inputs, ... }:

{

  options = {
    hyprland-config.enable = lib.mkEnableOption "enable user module";  
  };


  config = lib.mkIf config.hyprland-config.enable {

    wayland.windowManager.hyprland = {

      enable = true;

    };    

  };

}
