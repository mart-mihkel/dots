{pkgs, ...}: {
  imports = [
    ./kubujuss-headless.nix
    ./services/dunst.nix
    ./programs/waybar.nix
    ./programs/hypr.nix
    ./programs/rofi.nix
    ./programs/foot.nix
    ./programs/nvim
  ];

  home.pointerCursor = {
    enable = true;
    hyprcursor.enable = true;
    hyprcursor.size = 12;

    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
  };

  home.packages = with pkgs; [
    pulseaudio
    pulsemixer
    playerctl
    chromium
    bluetui
    feh
    vlc

    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
}
