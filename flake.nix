{
  description = "System configuration";

  inputs = {
    # Nix-related
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
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

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = ["nodejs-12.22.12"];
      };
    };

    pursPkgs = import easy-purescript-nix {inherit pkgs;};

    lib = nixpkgs.lib.extend (final: prev: let
      inherit (lib) mkOption types;
    in {
      mkOpt = type: default: mkOption {inherit type default;};
      mkOpt' = type: default: description:
        mkOption {inherit type default description;};
      mkBoolOpt = default:
        mkOption {
          inherit default;
          type = types.bool;
          example = true;
        };
    });

    overlay = final: prev: {
      inherit pursPkgs;
      alejandra = alejandra.defaultPackage.${system};
    };

    overlays = [overlay];
  in {
    homeManagerConfigurations = {
      trh = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        username = "trh";
        homeDirectory = "/home/trh";
        stateVersion = "21.11"; # Don't change this value
        configuration = {
          home.stateVersion = "21.11"; # Don't change this value
          programs.home-manager.enable = true;
          nixpkgs.overlays = overlays;
          imports = [./users/trh/home.nix];
        };
      };
    };

    # nixos-rebuild will automatically try to pair the host name from this
    # set with the host name of the system
    nixosConfigurations = {
      mira = lib.nixosSystem {
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
            virtualisation.podman.enable = true;
            # Create a `docker` alias for podman, to use it as a drop-in replacement
            virtualisation.podman.dockerCompat = true;
          }
        ];
      };
    };
  };
}
