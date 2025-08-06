{ pkgs, ... }:

{  
  environment.systemPackages = with pkgs; [
    podman-compose
    lazydocker
    compose2nix
  ];
  
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      dns_enabled = true;
    };
  };  
}
