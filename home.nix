{
  lib,
  config,
  pkgs,
  spicetify-nix,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jandro";
  home.homeDirectory = "/home/jandro";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # de
    waybar
    hyprshot
    hyprpaper
    rofi

    # gaming
    discord
    r2modman
    spotify-player
    sameboy
    nestopia-ue

    # terminal tools
    yazi
    bat
    tree
    fastfetch
    cmatrix
    gtypist
    starship

    # tools
    vlc
    gimp-with-plugins

    # development
    godot
    unzip
    lua
    cargo
    rustc
    clang
    go

    aseprite
    milkytracker
    furnace

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  home.file = {
    # HYPRLAND
    ".local/share/icons/miku-cursor-linux/".source = ./jandro/.local/share/icons/miku-cursor-linux;
    ".config/hypr/".source = ./jandro/.config/hypr;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    installVimSyntax = true;

    settings = {
      background-opacity = 0.75;
      theme = "Oxocarbon";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.starship = {
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

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.nvf = {
    enable = true;
    settings = ./nvf;
  };

  programs.spicetify = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "JandroGrant";
    userEmail = "jandrocottonball@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
