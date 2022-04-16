{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include other modules
    ../modules/system/fonts.nix
    ../modules/system/sound.nix
    ../modules/system/xorg.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set time zone.
  time.timeZone = "America/New_York";

  # Networking
  networking = {
    hostName = "mira";
    networkmanager.enable = true;

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # This should instead be set per-interface.
    useDHCP = false;
    interfaces = {
      enp5s0.useDHCP = true;
      enp6s0.useDHCP = true;
      wlp4s0.useDHCP = true;
    };
  };

  # Enable service discovery, like MacOS's Bonjour
  # https://avahi.org
  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  # Enable security keys
  services.pcscd.enable = true;
  services.udev.packages =
    [ pkgs.yubikey-personalization pkgs.ledger-udev-rules ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "Lat2-Terminus16";
  console.keyMap = "dvorak";

  # Nix settings
  nix = {
    package = pkgs.nixFlakes;
    trustedUsers = [ "root" "trh" "@wheel" ];
    extraOptions = ''
      experimental-features = nix-command flakes
   '';
  };

  # User account
  users.users.trh = {
    isNormalUser = true;
    initialPassword = "trh";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.bash;
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [ coreutils usbutils vim zsh ];
}
