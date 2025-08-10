{
  config = {
    vim = {
      lsp = {
        enable = true;
        formatOnSave = true; #unsure, this is just fine for now

        lspkind.enable = true;
        trouble.enable = true;
      };

      languages = {
        enableDAP = true;
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableTreesitter = true;

        bash.enable = true;
        rust.enable = true;
        nix.enable = true;
        lua.enable = true;
        go.enable = true;
        clang.enable = true;
      };

      diagnostics = {
        enable = true;
        config = {
          virtual_text = true;
          update_in_insert = true;
        };
      };

      autocomplete.blink-cmp.enable = true;
      autopairs.nvim-autopairs.enable = true;
      binds.cheatsheet.enable = true;
      comments.comment-nvim.enable = true;

      dashboard.startify = {
        enable = true;
      };

      debugger.nvim-dap = {
        enable = true;

        ui = {
          enable = true;
          autoStart = true;
        };
      };

      runner.run-nvim.enable = true;

      filetree.neo-tree = {
        enable = true;

        setupOpts = {
          enable_cursor_hijack = true;
          enable_diagnostics = true;
          enable_git_status = true;
          enable_modified_markers = true;
          enable_opened_markers = true;
        };
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        vim-fugitive.enable = true;
      };

      notes.todo-comments.enable = true;
      statusline.lualine.enable = true;

      terminal.toggleterm = {
        enable = true;
        lazygit = {
          enable = true;
        };
      };

      telescope = {
        enable = true;
        setupOpts.defaults = {
          file_ignore_patterns = ["out/" "build/" ".git/"];
        };
      };

      treesitter = {
        enable = true;
        fold = true;
        indent.enable = true;
        highlight.enable = true;
      };

      ui = {
        colorizer.enable = true;

        noice = {
          enable = true;
        };
      };

      utility = {
        preview.markdownPreview.enable = true;
        motion.flash-nvim.enable = true;
        yazi-nvim.enable = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;

        highlight-undo.enable = true;
      };

      mini.surround.enable = true;
    };
  };
}
