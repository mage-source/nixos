{ lib, config, pkgs, inputs, ... }:

{

  options = {
    hyprland-config.enable = lib.mkEnableOption "enable user module";  
  };


  config = lib.mkIf config.hyprland-config.enable {

    wayland.windowManager.hyprland.enable = true;

    wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, F, exec, firefox"
          "$mod, Return, exec, alacritty"
          "$mod SHIFT, Q, exec, hyprctl dispatch exit"
          "$mod, W, killactive"
          ", Print, exec, grimblast copy area"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
          );
        monitor = [
          "eDP-1, preferred, 0x0, 1"
          "DP-2, preferred, 0x-1080, 1"
        ];
        input = {
            kb_options = "caps:swapescape";
        };
      };

  };

}
