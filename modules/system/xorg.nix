{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    windowManager.awesome.enable = true;
    displayManager.lightdm.enable = true;

    # Keyboard layout
    layout = "us";
    xkbVariant = "dvorak";
  };
}
