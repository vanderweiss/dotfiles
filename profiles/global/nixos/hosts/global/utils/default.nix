{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    dash
    fish
    neovim
    tree
    lsd
    bat
    btop   
  ];
  
}
