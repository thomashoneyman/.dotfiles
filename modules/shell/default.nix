{ config, pkgs, ... }:

{
  imports = [ ];

  home.packages = with pkgs; [
    # basic cli
    tree

    # language-specific
    nixfmt

    # gpg
    gnupg
    pinentry_qt
    git-crypt
  ];

  # GPG
  programs.gpg.enable = true;
  services.gpg-agent.enable = true;
  services.gpg-agent.pinentryFlavor = "qt";

  programs.ssh.enable = true;

  programs.alacritty.enable = true;

  programs.htop.enable = true;

  programs.starship = {
    enable = true;
    settings.character.success_symbol = "[➜](bold green)";
    settings.character.error_symbol = "[➜](bold red)";
  };

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export PATH=$HOME/.bin:$PATH
    '';
  };

  programs.git = {
    enable = true;
    userName = "Thomas Honeyman";
    userEmail = "hello@thomashoneyman.com";
    signing = {
      key = "80AF1744";
      signByDefault = true;
    };
    extraConfig = {
      core.editor = "vim";
      github.username = "thomashoneyman";
    };
  };

  home.file.".bin".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.dotfiles/bin";
}
