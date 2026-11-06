{ ... }:

{
  users.users.aditya = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "dialout" ];
  };
}
