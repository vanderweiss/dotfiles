# Configuration for Raspberry Pi 4 [4GB] code name "valine"

{ ... }:{
      
  imports = [
    ../../hosts/global

    # Optional global features used by this host (server setup, shell utilities, virtualisation)
    ../../hosts/global/server
    ../../hosts/global/utils
    ../../hosts/global/virtual

    # Host-specific (hardware, boot, networking, native containers)
    ./hardware.nix
    ./boot.nix
    ./networking.nix
    ./oci-containers.nix
  ]; 

  # Code name assigned to host name
  networking.hostName = "valine";

  # Timezone set to the host's location in Peru, Lima
  time.timeZone = "America/Lima";


  system.stateVersion = "25.05";

}
