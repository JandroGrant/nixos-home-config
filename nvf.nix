{
  pkgs,
  lib,
  ...
}: {
  vim = {
    options = {
      shiftwidth = 2;
      tabstop = 2;
    };

    keymaps = [
      {
        key = "<leader>ll";
        mode = "n";
        silent = true;
        action = ":w <BAR> !love .<CR>";
      }
      {
        key = "<leader>tt";
        mode = "n";
        silent = true;
        action = ":ToggleTerm<CR>";
      }
    ];

    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
      transparent = true;
    };

    statusline.lualine = {
      enable = true;
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };

    spellcheck = {
      enable = true;
    };

    lsp = {
      # This must be enabled for the language modules to hook into
      # the LSP API.
      enable = true;

      formatOnSave = true;
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;

      nix.enable = true;
      lua.enable = true;

      rust = {
        enable = true;
        dap.enable = true;
        lsp.enable = true;
        treesitter.enable = true;

        crates = {
          enable = true;
          codeActions = true;
        };
      };

      clange.enable = true;

      markdown.enable = true;
      html.enable = true;
    };

    runner.run-nvim = {
      enable = true;
      setupOpts = {
        rust = "cargo run";
      };
    };

    autocomplete = {
      blink-cmp.enable = true;
    };

    debugger.nvim-dap.enable = true;

    snippets.luasnip.enable = true;

    filetree = {
      neo-tree = {
        enable = true;
      };
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    treesitter = {
      enable = true;
      fold = true;
      indent.enable = true;
    };

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
      hardtime-nvim.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
    };

    minimap = {
      minimap-vim.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = true;
      alpha.enable = true;
    };

    notify = {
      nvim-notify.enable = true;
    };

    projects = {
      project-nvim.enable = true;
    };

    utility = {
      surround.enable = true;
      icon-picker.enable = true;
      leetcode-nvim.enable = true;
      multicursors.enable = true;

      motion = {
        hop.enable = true;
        leap.enable = true;
        precognition.enable = true;
      };
      images = {
        image-nvim.enable = false;
        img-clip.enable = true;
      };
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    session = {
      nvim-session-manager.enable = false;
    };

    comments = {
      comment-nvim.enable = true;
    };
  };
}
