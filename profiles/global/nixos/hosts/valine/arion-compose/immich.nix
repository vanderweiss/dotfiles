{ pkgs, ... }:

let
  immichVersion = "release";
  immichUploadLocation = "/var/lib/immich/upload";
  immichDbDataLocation = "/var/lib/immich/database";

  immichDbUser = "postgres";
  immichDbPassword = "postgres";
  immichDbName = "immich";

  immichServiceEnv = {
    IMMICH_VERSION = immichVersion;
    UPLOAD_LOCATION = immichUploadLocation;
    DB_PASSWORD = immichDbPassword;
    DB_USERNAME = immichDbUser;
    DB_DATABASE_NAME = immichDbName;
    DB_DATA_LOCATION = immichDbDataLocation;
  };
in 
{

  project.name = "immich-valine";

  services = {
    immich-server = {
      service = {
        container_name = "immich_server";
        image = "ghcr.io/immich-app/immich-server:${immichVersion}";
        useHostStore = true;
        volumes = [
          "${immichUploadLocation}:/usr/src/app/upload"
          "/etc/localtime:/etc/localtime:ro"
        ];
        ports = [ "2283:2283" ];
        environment = immichServiceEnv;
        depends_on = [ "redis" "database" ];
        restart = "always";
      }; 
    };

    immich-machine-learning = {
      service = {
        container_name = "immich_machine_learning";
        image = "ghcr.io/immich-app/immich-machine-learning:${immichVersion}";
        useHostStore = true;
        volumes = [ "model-cache:/cache" ];
        environment = immichServiceEnv;
        restart = "always";
      };
    };

    redis = {
      service = {
        container_name = "immich_redis";
        image = "docker.io/valkey/valkey:8-bookworm@sha256:facc1d2c3462975c34e10fccb167bfa92b0e0dbd992fc282c29a61c3243afb11";
        useHostStore = true;
        healthcheck = { test = [ "CMD-SHELL" "redis-cli ping || exit 1" ]; };
        restart = "always";
      };
    };

    database = {
      service = {
        container_name = "immich_postgres";
        image = "ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0@sha256:5f6a838e4e44c8e0e019d0ebfe3ee8952b69afc2809b2c25f7b0119641978e91";      
        volumes = [ "${immichDbDataLocation}:/var/lib/postgresql/data" ];
        environment = {
          POSTGRES_PASSWORD = immichDbPassword;
          POSTGRES_USER = immichDbUser;
          POSTGRES_DB = immichDbName;
          POSTGRES_INITDB_ARGS = "--data-checksums";
        };
        restart = "always";
      };
    };
  };

  docker-compose.volumes = {
    model-cache = {};  
  };
  
}
