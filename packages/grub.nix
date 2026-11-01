{ pkgs, ... }:

{
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";

    useOSProber = true;

    theme = null;
    splashImage = null;
    backgroundColor = "#11111b";

    timeoutStyle = "menu";
  };
  boot.loader.timeout=5;
  boot.loader.systemd-boot.enable = false;

  boot.loader.efi.canTouchEfiVariables = true;
}
