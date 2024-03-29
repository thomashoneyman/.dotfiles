{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include other modules
    ../modules/system/fonts.nix
    ../modules/system/sound.nix
    ../modules/system/xorg.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

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
  programs.ssh.startAgent = false;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.pcscd.enable = true;
  services.udev.packages = [pkgs.yubikey-personalization pkgs.ledger-udev-rules];

  # Mullvad
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  environment.systemPackages = with pkgs; [
    coreutils
    usbutils
    vim
    zsh
    gnupg
    pinentry-curses
    pinentry-qt
    paperkey
    wget
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "Lat2-Terminus16";
  console.keyMap = "dvorak";

  # Nix settings
  nix = {
    package = pkgs.nixFlakes;
    settings.trusted-users = ["root" "trh" "@wheel"];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # User account
  users.users.trh = {
    isNormalUser = true;
    initialPassword = "trh";
    extraGroups = ["wheel" "networkmanager" "docker"];
    shell = pkgs.bash;
  };
}
