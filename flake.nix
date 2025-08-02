{
  description = "My first Flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    alejandra,
    nvf,
    spicetify-nix,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      nixos-morningstar = lib.nixosSystem {
        inherit system;
        modules = [./configuration.nix {environment.systemPackages = [alejandra.defaultPackage.${system}];}];
      };
    };

    homeConfigurations = {
      jandro = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          nvf.homeManagerModules.default
          spicetify-nix.homeManagerModules.default
        ];
      };
    };
  };
}
