{pkgs, ...}: {
  imports = [
    ./programs/tmux.nix
    ./programs/btop.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/vim.nix
  ];

  programs.home-manager.enable = true;

  home.username = "kubujuss";
  home.homeDirectory = "/home/kubujuss";
  home.packages = with pkgs; [
    cloudflared
    fastfetch
    ripgrep
    glow
    tree
    bat
    fzf
    fd
  ];

  home.stateVersion = "24.05";
}
