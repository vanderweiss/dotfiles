{ ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      LogLevel = "ERROR";
    };
  };

  users.users.you.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPhCqDLq5p8BuBXDe07rPJRZ3YrsFxBkG8slyNbdvKwD vanderweiss@proton.me"
  ]; 
}
