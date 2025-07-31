{ ... }:{

  networking = {
    useDHCP = false;
    defaultGateway = "192.168.0.1";
    nameservers = [
      "192.168.0.1"
      "8.8.8.8"
      "1.1.1.1"
    ];

    interfaces.end0 = {
      ipv4.addresses = [
        {
          address = "192.168.0.101";
          prefixLength = 24;
        }
      ];
    };

    firewall.allowedTCPPorts = [ 22 88 443 8080 ];
  };
    
}
