{ config, inputs, pkgs, ... }:

{
  imports = [
    inputs.inir.nixosModules.inir
  ];

  programs.niri.enable = true;

  programs.inir = {
    enable = true;
    service.compositor = "niri";
    extraPackages = [
      config.programs.niri.package
    ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
