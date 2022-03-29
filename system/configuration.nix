{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Flakes
  # nix.package = pkgs.nixFlakes;
  # nix.extraOptions = ''
  #   experimental-features = nix-command flakes
  # '';

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  networking.interfaces.enp6s0.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "dvorak";

  # Nixpkgs settings
  nixpkgs.config.allowUnfree = true;

  # Hardware settings
  hardware.opengl.enable = true;
  hardware.system76.enableAll = true;

  # Desktop environment
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.awesome.enable = true;
    videoDrivers = [ "nvidia" ];
    
    # Touchpad support
    libinput.enable = false;

    # Keyboard layout
    layout = "us";
    xkbVariant = "dvorak";
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # User account
  users.users.trh = {
    isNormalUser = true;
    initialPassword = "trh";
    extraGroups = 
      [ "wheel" 
        "networkmanager"
      ];
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    vim wget
  ];

  # Don't change without reading the documentation for this option.
  system.stateVersion = "21.11"; # Did you read the comment?
}

