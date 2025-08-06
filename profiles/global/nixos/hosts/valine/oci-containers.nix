{ config, lib, ... }:

let
  immichLocal = builtins.fromTOML (builtins.readFile ./local/immich.toml);
in
{
  imports = [
    ../../hosts/global/virtual/oci-containers/basement.nix
    ../../hosts/global/virtual/oci-containers/immich.nix
    ../../hosts/global/virtual/oci-containers/dozzle.nix
  ];

  oci.dozzle.enable = true;
  oci.immich.enable = true;  

  oci.immich.dbUser = immichLocal.database.user;
  oci.immich.dbPassword = immichLocal.database.password;
  oci.immich.dbName = immichLocal.database.name;
}
