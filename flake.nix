{
  description = "System configuration";

  inputs = {
    # Nix-related
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";

    home-manager = {
      url = "github:nix-community/home-manager/4c5106ed0f3168ff2df21b646aef67e86cbfc11c";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/1.2.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Language
    easy-purescript-nix = {
      url = "github:justinwoo/easy-purescript-nix";
      flake = false;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    easy-purescript-nix,
    alejandra,
    ...
  }: let
    system = "x86_64-linux";

    pkgs =
      nixpkgs.legacyPackages.${system}
      // {
        config = {
          allowUnfree = true;
          permittedInsecurePackages = ["nodejs-12.22.12"];
        };
      };

    pursPkgs = import easy-purescript-nix {inherit pkgs;};

    overlay = final: prev: {
      inherit pursPkgs;
      alejandra = alejandra.defaultPackage.${system};
    };

    overlays = [overlay];

    hm-configuration = {...}: {
      nixpkgs.overlays = overlays;
      imports = [./users/trh/home.nix];
    };
  in {
    homeManagerConfigurations = {
      trh = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [hm-configuration];
      };
    };

    # nixos-rebuild will automatically try to pair the host name from this
    # set with the host name of the system
    nixosConfigurations = {
      mira = nixpkgs.lib.nixosSystem {
        inherit system pkgs;

        modules = [
          {
            nixpkgs.overlays = overlays;
            system.stateVersion = "21.11";
          }

          ./system/configuration.nix

          {
            # Some specific hardware settings
            hardware.bluetooth.enable = true;
            hardware.opengl.enable = true;
            hardware.system76.enableAll = true;
            services.xserver.libinput.enable = false;
            services.xserver.videoDrivers = ["nvidia"];
            virtualisation.docker.enable = true;
          }
        ];
      };
    };
  };
}
