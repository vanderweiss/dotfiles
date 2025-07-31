{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    dash
    fish
    neovim
    tree
    eza
    bat
    btop   
  ];
  
}
