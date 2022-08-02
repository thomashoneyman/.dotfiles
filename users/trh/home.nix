{...}: {
  imports = [
    # Auto-loading modules
    ../../modules/desktop
    ../../modules/shell
    ../../modules/programs
    ../../modules/dev
  ];

  config = {
    home.stateVersion = "21.11"; # Don't change this value
    home.username = "trh";
    home.homeDirectory = "/home/trh";
    programs.home-manager.enable = true;
  };
}
