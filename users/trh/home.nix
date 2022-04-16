{ config, pkgs, lib, ... }:

{
  imports = [
    # Auto-loading modules
    ../../modules/shell
    ../../modules/programs
    #    ../../modules/desktop

    # Optional modules, must be enabled explicitly
    ../../modules/dev
  ];

  # Enable optional modules here
  config.modules = { dev = { purescript.enable = true; }; };

}
