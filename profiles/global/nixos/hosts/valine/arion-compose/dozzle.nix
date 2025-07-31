{ ... }:{

  project.name = "dozzle-valine";

  services = {
    dozzle = {
      service = {
        container_name = "dozzle";        
        image = "amir20/dozzle:latest";
        useHostStore = true;
        volumes = [ "/var/run/docker.sock:/var/run/docker.sock:ro" ];
        ports = [ "8080:8080" ];
      };
    }; 
  };
  
}
