{...}: {
  imports = [
    # Auto-loading modules
    ../../modules/desktop
    ../../modules/shell
    ../../modules/programs

    # Optional modules, must be enabled explicitly
    ../../modules/dev
  ];

  config = {
    home.stateVersion = "21.11"; # Don't change this value
    home.username = "trh";
    home.homeDirectory = "/home/trh";
    programs.home-manager.enable = true;

    # Enable optional modules here
    modules = {dev = {purescript.enable = true;};};
  };
}
