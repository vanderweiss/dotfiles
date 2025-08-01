{ pkgs, lib, ... }:

let
  immichConfig = {
    version = "release";
    uploadLocation = "/var/lib/immich/upload";
    dbDataLocation = "/var/lib/immich/database";
    dbUser = "immich_user";
    dbPassword = "postgres";
    dbName = "immich_db";
  };

  immichServiceEnv = {
    IMMICH_VERSION = immichConfig.version;
    UPLOAD_LOCATION = immichConfig.uploadLocation;
    DB_PASSWORD = immichConfig.dbPassword;
    DB_USERNAME = immichConfig.dbUser;
    DB_DATABASE_NAME = immichConfig.dbName;
  };

in
{  

  virtualisation.oci-containers.containers."immich_machine_learning" = {
    image = "ghcr.io/immich-app/immich-machine-learning:${immichConfig.version}";
    environment = immichServiceEnv;
    volumes = [
      "immich_model-cache:/cache"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=immich-machine-learning"
      "--network=immich_default"
    ];
  };
  
  systemd.services."podman-immich_machine_learning" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-immich_default.service"
      "podman-volume-immich_model-cache.service"
    ];
    requires = [
      "podman-network-immich_default.service"
      "podman-volume-immich_model-cache.service"
    ];
    partOf = [
      "podman-compose-immich-root.target"
    ];
    wantedBy = [
      "podman-compose-immich-root.target"
    ];
  };
  
  virtualisation.oci-containers.containers."immich_postgres" = {
    image = "ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0@sha256:32324a2f41df5de9efe1af166b7008c3f55646f8d0e00d9550c16c9822366b4a";
    environment = {
      "POSTGRES_DB" = immichConfig.dbName;
      "POSTGRES_INITDB_ARGS" = "--data-checksums";
      "POSTGRES_PASSWORD" = immichConfig.dbPassword;
      "POSTGRES_USER" = immichConfig.dbUser;
    };
    volumes = [
      "${immichConfig.dbDataLocation}:/var/lib/postgresql/data"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=database"
      "--network=immich_default"
      "--shm-size=134217728"
    ];
  };
  
  systemd.services."podman-immich_postgres" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-immich_default.service"
    ];
    requires = [
      "podman-network-immich_default.service"
    ];
    partOf = [
      "podman-compose-immich-root.target"
    ];
    wantedBy = [
      "podman-compose-immich-root.target"
    ];
  };
  
  virtualisation.oci-containers.containers."immich_redis" = {
    image = "docker.io/valkey/valkey:8-bookworm@sha256:facc1d2c3462975c34e10fccb167bfa92b0e0dbd992fc282c29a61c3243afb11";
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=redis-cli ping || exit 1"
      "--network-alias=redis"
      "--network=immich_default"
    ];
  };
  
  systemd.services."podman-immich_redis" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-immich_default.service"
    ];
    requires = [
      "podman-network-immich_default.service"
    ];
    partOf = [
      "podman-compose-immich-root.target"
    ];
    wantedBy = [
      "podman-compose-immich-root.target"
    ];
  };
  
  virtualisation.oci-containers.containers."immich_server" = {
    image = "ghcr.io/immich-app/immich-server:${immichConfig.version}";
    environment = immichServiceEnv;
    volumes = [
      "${immichConfig.uploadLocation}:/usr/src/app/upload"
      "/etc/localtime:/etc/localtime:ro"
    ];
    ports = [
      "2283:2283/tcp"
    ];
    dependsOn = [
      "immich_postgres"
      "immich_redis"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=immich-server"
      "--network=immich_default"
    ];
  };
  systemd.services."podman-immich_server" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-immich_default.service"
    ];
    requires = [
      "podman-network-immich_default.service"
    ];
    partOf = [
      "podman-compose-immich-root.target"
    ];
    wantedBy = [
      "podman-compose-immich-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-immich_default" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f immich_default";
    };
    script = ''
      podman network inspect immich_default || podman network create immich_default
    '';
    partOf = [ "podman-compose-immich-root.target" ];
    wantedBy = [ "podman-compose-immich-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-immich_model-cache" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect immich_model-cache || podman volume create immich_model-cache
    '';
    partOf = [ "podman-compose-immich-root.target" ];
    wantedBy = [ "podman-compose-immich-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-immich-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
