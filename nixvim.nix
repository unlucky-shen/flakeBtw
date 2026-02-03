{ config, pkgs, lib, nixvim, ... }: {

programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      termguicolors = true;
    };

    colorschemes.gruvbox-material.enable = true;

};

}

