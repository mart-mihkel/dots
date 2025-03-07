{ pkgs, ... }:

{
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  programs.nix-ld.enable = true;

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    neofetch
    gnumake
    ripgrep
    nodejs
    cargo
    tmux
    curl
    wget
    tree
    btop
    wol
    git
    gcc
    vim
    fzf
    uv
    jq
  ];
}
