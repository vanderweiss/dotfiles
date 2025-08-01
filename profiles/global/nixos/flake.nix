{
  
  description = "Europa's flake";

  inputs = {
    nixpkgs.url =         "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url =         "github:chaotic-cx/nyx/nyxpkgs-unstable";    
  };

  outputs = { self, nixpkgs, arion, chaotic, ... }: {
    nixosConfigurations.valine = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry
        ./hosts/valine
      ];
    };
  };
  
}
