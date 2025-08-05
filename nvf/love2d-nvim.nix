{
  inputs,
  pkgs,
  ...
}: let
  love2d-nvim-from-source = pkgs.vimUtils.buildVimPlugin {
    name = "love2d";
    src = inputs.love2d-nvim;
  };
in {
  vim.extraPlugins = {
    love2d-nvim = {
      package = love2d-nvim-from-source;
      setup = "require('love2d').setup{}";
    };
  };
}
