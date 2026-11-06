
{
  description = ":wqconfiguration";

  inputs = {
    spotifast.url = "github:crmne/spotifast";

    nvim = {
      url = "git+file:///home/aditya/nvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    inir.url = "github:snowarch/inir";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, inir, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      # Makes inputs.inir available to desktop.nix and other modules.
      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hosts/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.aditya = import ./home;
        }
      ];
    };
  };
}

