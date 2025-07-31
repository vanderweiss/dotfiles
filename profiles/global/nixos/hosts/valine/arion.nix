{ ... }: {

  virtualisation.arion.backend = "docker";
  virtualisation.arion.projects = {
    dozzle = {
      serviceName = "dozzle";
      settings = {
        imports = [ ./arion-compose/dozzle.nix  ];
      };
    };

    immich = {
      serviceName = "immich";
      settings = {
        imports = [ ./arion-compose/immich.nix ];
      };
    };
  };
  
}
