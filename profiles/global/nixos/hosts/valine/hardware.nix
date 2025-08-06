{ lib, pkgs, ... }:

{ 
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;

  hardware.deviceTree = let
    raspberrypifw = pkgs.raspberrypifw.overrideAttrs {
      version = "pinned-2023.05.12";
      src = pkgs.fetchFromGitHub {
        owner = "raspberrypi";
        repo = "firmware";
        rev = "b49983637106e5fb33e2ae60d8c15a53187541e4";
        hash = "sha256-Ia+pUTl5MlFoYT4TrdAry0DsoBrs13rfTYx2vaxoKMw=";
      };
    };
  in {
    enable = true;

    dtbSource = pkgs.device-tree_rpi.override { inherit raspberrypifw; };
    filter = "bcm2711-rpi-4-b.dtb";
    name = "broadcom/bcm2711-rpi-4-b.dtb";

    overlays = let
      upstreamOverlay = name: raspberrypifw + /share/raspberrypi/boot/overlays/${name}.dtbo;
    in [
      {
        name = "custom-enable-method";
        dtsText = ''
          /dts-v1/;
          /plugin/;

          / {
            compatible = "brcm,bcm2711";

            fragment@0 {
              target = <&cpus>;
              __overlay__ {
                /delete-property/ enable-method;
              };
            };

            fragment@1 {
              target-path = "/";
              __overlay__ {
                psci {
                  compatible = "arm,psci-1.0", "arm,psci-0.2";
                  method = "smc";
                };
              };
            };

            fragment@2 {
              target = <&cpu0>;
              __overlay__ {
                enable-method = "psci";
                /delete-property/ cpu-release-addr;
              };
            };

            fragment@3 {
              target = <&cpu1>;
              __overlay__ {
                enable-method = "psci";
                /delete-property/ cpu-release-addr;
              };
            };

            fragment@4 {
              target = <&cpu2>;
              __overlay__ {
                enable-method = "psci";
                /delete-property/ cpu-release-addr;
              };
            };

            fragment@5 {
              target = <&cpu3>;
              __overlay__ {
                enable-method = "psci";
                /delete-property/ cpu-release-addr;
              };
            };

          };
        '';
      }

      {
        name = "upstream-pi4";
        dtboFile = upstreamOverlay "upstream-pi4";
      }

    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "xfs";
    options = [ "noatime" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/efi";
    fsType = "vfat";
    options = [ "noatime" "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-label/swap";
    }
  ];   
}
