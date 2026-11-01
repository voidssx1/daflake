 { pkgs, inputs, ... }:

let
  helium = pkgs.callPackage ../packages/helium.nix {};
in
{
  environment.systemPackages = with pkgs; [
    swaylock
    waybar
    inputs.spotifast.packages."${pkgs.stdenv.hostPlatform.system}".default
    # Niri                  
    quickshell
    mako
    fuzzel
    thunar
    awww
    wl-clipboard
    brightnessctl
    playerctl
    nerd-fonts.iosevka

    #dev-tools
    git
    gh
    curl
    python3
    uv 
    go 
    gopls
    gcc
    golangci-lint
    clang-tools
    cmake
    ninja
    gdb
    rustc
    cargo 
    rust-analyzer
    rustfmt
    clippy
    lua-language-server
    pyright
    ruff 
    nodejs

    # Larping                 
    librewolf
    helium
    btop
    fastfetch
    fzf
    bat
    lazygit
    eza
    starship
    nerd-fonts.iosevka
    legcord
    tree
    obsidian
    xwayland-satellite
    mysql-workbench
    neovim
    libreoffice
  ];
}
