{ config, pkgs, ... }:

{
  # Required Home Manager information
  home.username = "trh";
  home.homeDirectory = "/home/trh";

  home.packages = with pkgs; [
    alacritty
    git
    git-crypt
    gnupg
    htop
    tree

    # Required for gpg
    pinentry_qt 
  ];

  programs.git = {
    userName = "Thomas Honeyman";
    userEmail = "hello@thomashoneyman.com";
  };

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  home.file = {
    ".config/alacritty/alacritty.yaml".text = ''
      env:
        TERM: xterm-256color
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
