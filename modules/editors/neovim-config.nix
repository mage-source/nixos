{ lib, config, pkgs, inputs, ... }:

{

  options = {
    neovim-config.enable = lib.mkEnableOption "enable user module";  
  };


  config = lib.mkIf config.neovim-config.enable {

    programs.neovim = {
      enable = true;

      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = ''
        ${builtins.readFile ./set.lua}
        ${builtins.readFile ./remap.lua}
      '';

      extraPackages = with pkgs; [
        xclip
        wl-clipboard
        luajitPackages.lua-lsp
      ];

    };    

  };

}
