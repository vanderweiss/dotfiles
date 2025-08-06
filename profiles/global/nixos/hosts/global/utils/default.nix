{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dash
    fish
    neovim
    tree
    file
    eza
    bat
    fd
    nmap
    poop
    btop
    neofetch
    fastfetch 
  ];  
}
