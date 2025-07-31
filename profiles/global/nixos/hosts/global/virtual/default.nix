{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    docker-compose
    lazydocker
    arion
  ];

  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune.enable = true;
  virtualisation.docker.storageDriver = "overlay2";

  users.users.you.extraGroups = [ "docker" ];

}
