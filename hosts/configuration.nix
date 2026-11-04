{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/desktop.nix
    ../modules/packages.nix
    ../modules/nix-ld.nix
    ../modules/users.nix
    ../packages/grub.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.niri.enable = true;
  services.displayManager.ly.enable = true;

  time.timeZone = "Asia/Kolkata";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkg.pname or "") [
      "obsidian"
      "nvidia-x11"
      "nvidia-settings"
    ];

  # AMD + NVIDIA hybrid graphics
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaSettings = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      amdgpuBusId = "PCI:5@0:0:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };

  security.pam.services.swaylock = {};

  system.stateVersion = "26.05";
}
