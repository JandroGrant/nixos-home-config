{
  config.vim = {
    viAlias = false;
    vimAlias = false;
    searchCase = "smart";

    preventJunkFiles = true;

    undoFile = {
      enable = true;
    };

    theme = {
      enable = true;
      name = "oxocarbon";
      style = "dark";
      # transparent = true;
    };

    options = rec {
      cursorlineopt = "both";
      shiftwidth = 4;
      tabstop = shiftwidth;
      softtabstop = shiftwidth;
    };

    luaConfigPost = ''
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {"nix", "c", "cpp"},
        callback = function(opts)
          local bo = vim.bo[opts.buf]
          bo.tabstop = 2
          bo.shiftwidth = 2
        end
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function(opts)
          local bo = vim.bo[opts.buf]
          bo.tabstop = 3
          bo.shiftwidth = 3
        end
      })
    '';
  };
}
