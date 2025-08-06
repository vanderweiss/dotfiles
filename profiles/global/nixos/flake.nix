{
  description = "Europa's flake";

  inputs = {
    nixpkgs.url  =        "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url  =        "github:chaotic-cx/nyx/nyxpkgs-unstable";    
    sops-nix.url =        "github:Mic92/sops-nix";

    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, chaotic, sops-nix,  ... }: {
    nixosConfigurations.valine = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry
        sops-nix.nixosModules.sops
        ./hosts/valine
      ];
    };
  }; 
}
