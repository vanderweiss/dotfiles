{ lib, pkgs, ... }:

{
  boot = {
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 16;
      editor = false;
    };

    initrd = {
      systemd.enable = true;
      availableKernelModules = [
        "xfs"
        "usbhid"
        "usb_storage"
        "xhci_hcd"
        "uas"
        "vc4"
        "pcie_brcmstb"
        "reset-raspberrypi"
      ];
    };

    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    kernelParams = lib.mkAfter [
      "rootwait"
      "usbcore.autosuspend=-1"
      "console=serial0,115200"
      "console=tty1"
      "mitigations=off"
    ];
  };  
}
