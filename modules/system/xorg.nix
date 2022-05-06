{ config, pkgs, ... }:

{
  environment.gnome.excludePackages = [
    pkgs.gnome.cheese
    pkgs.gnome-photos
    pkgs.gnome.gnome-music
    pkgs.gnome.gnome-terminal
    pkgs.gnome.gedit
    pkgs.epiphany
    pkgs.evince
    pkgs.gnome.gnome-characters
    pkgs.gnome.totem
    pkgs.gnome.tali
    pkgs.gnome.iagno
    pkgs.gnome.hitori
    pkgs.gnome.atomix
    pkgs.gnome-tour
    pkgs.gnome.geary
  ];

  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # windowManager.awesome.enable = true;
    # displayManager.lightdm.enable = true;

    # Keyboard layout
    layout = "us";
    xkbVariant = "dvorak";
  };
}
