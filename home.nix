{
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
    xfce.thunar

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

    # tools
    vlc
    vim
    gimp-with-plugins

    # music
    # ardour
    # zrythm
    audacity

    # development
    vscodium
    love
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

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # HYPRLAND
    ".local/share/icons/miku-cursor-linux/".source = ./jandro/.local/share/icons/miku-cursor-linux;
    ".config/hypr/".source = ./jandro/.config/hypr;

    # GHOSTTY
    # ".config/ghostty/".source = ./jandro/.config/ghostty;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jandro/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;

    settings = {
      background-opacity = 0.75;
      # theme = "Tomorrow Night Burns";
      theme = "Oxocarbon";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
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
