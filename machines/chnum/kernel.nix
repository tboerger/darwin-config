{ config, lib, pkgs, ... }:

{
  boot = {
    kernelModules = [
      "kvm-intel"
    ];

    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];

      kernelModules = [
        "dm-snapshot"
      ];
    };
  };
}
