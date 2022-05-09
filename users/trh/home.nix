{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Auto-loading modules
    ../../modules/desktop
    ../../modules/shell
    ../../modules/programs

    # Optional modules, must be enabled explicitly
    ../../modules/dev
  ];

  # Enable optional modules here
  config.modules = {dev = {purescript.enable = true;};};
}
