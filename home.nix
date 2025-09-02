{
  lib,
  config,
  pkgs,
  system,
  inputs,
  spicetify-nix,
  ...
}: {
  home = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    # home.username = "jandro";
    # home.homeDirectory = "/home/jandro";
    username = "jandro";
    homeDirectory = "/home/jandro";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    # home.stateVersion = "25.05"; # Please read the comment before changing.

    stateVersion = "25.05";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      # de
      waybar
      hyprshot
      hyprpaper
      rofi
      inputs.zen-browser.packages."${system}".default

      # gaming
      discord-ptb
      r2modman
      spotify-player
      sameboy
      nestopia-ue
      prismlauncher

      # terminal tools
      yazi
      bat
      tree
      fastfetch
      cmatrix
      gtypist
      starship
      inputs.my-nvf.packages.${pkgs.system}.default

      # tools
      vlc
      gimp-with-plugins
      unzip

      # development
      lua
      zig

      aseprite
      milkytracker
      furnace

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    ];

    file = {
      # HYPRLAND
      ".local/share/icons/miku-cursor-linux/".source = ./jandro/.local/share/icons/miku-cursor-linux;
      ".config/hypr/".source = ./jandro/.config/hypr;
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
    };

    # ghostty = {
    #   enable = true;
    #   enableBashIntegration = true;
    #   installVimSyntax = true;

    #   settings = {
    #     background-opacity = 0.75;
    #     theme = "Oxocarbon";
    #   };
    # };

    git = {
      enable = true;
      userName = "JandroGrant";
      userEmail = "jandrocottonball@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    irssi = {
      enable = true;
    };

    kitty = {
      enable = true;
      settings = {
        background_opacity = "0.75";
        cursor_trail = "1";
      };
      extraConfig = ''
        # oxocarbon theme ported to kitty, https://github.com/hbjydev/oxocarbon-kitty
        # originally made by nyoom, https://github.com/nyoom-engineering/oxocarbon

        foreground #dde1e6
        background #161616
        selection_foreground #f2f4f8
        selection_background #525252

        cursor #f2f4f8
        cursor_text_color #393939

        url_color #ee5396
        url_style single

        active_border_color #ee5396
        inactive_border_color #ff7eb6

        bell_border_color #ee5396

        wayland_titlebar_color system
        macos_titlebar_color system

        active_tab_foreground #161616
        active_tab_background #ee5396
        inactive_tab_foreground #dde1e6
        inactive_tab_background #393939
        tab_bar_background #161616

        color0 #262626
        color8 #393939

        color1 #ff7eb6
        color9 #ff7eb6

        color2  #42be65
        color10 #42be65

        color3  #82cfff
        color11 #82cfff

        color4  #33b1ff
        color12 #33b1ff

        color5  #ee5396
        color13 #ee5396

        color6  #3ddbd9
        color14 #3ddbd9

        color7  #dde1e6
        color15 #ffffff

        # vim:ft=conf
      '';
    };

    # nvf = {
    #   enable = true;
    #   settings = ./nvf;
    # };

    spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;
      theme = spicePkgs.themes.defaultDynamic;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        skipOrPlayLikedSongs
        fullAlbumDate
      ];
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        add_newline = true;
        format = lib.concatStrings [
          "$shlvl"
          "$shell"
          "$username"
          "$hostname"
          "$nix_shell"
          "$git_branch"
          "$git_commit"
          "$git_state"
          "$git_status"
          "$directory"
          "$jobs"
          "$cmd_duration"
          "$character"
        ];
      };
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };

    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };
}
