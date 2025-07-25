{pkgs, ...}: let
  cfg = ''
    [main]
    font=Jetbrains Mono Nerd Font:size=15
    term=xterm-256color
    pad=0x0 center

    [cursor]
    color=282828 eceff4

    [colors]
    foreground=d8dee9
    background=2e3440
    selection-background=eceff4
    selection-foreground=4c566a
    regular0=3b4252
    regular1=bf616a
    regular2=a3be8c
    regular3=ebcb8b
    regular4=81a1c1
    regular5=b48ead
    regular6=88c0d0
    regular7=e5e9f0
    bright0=4c566a
    bright1=bf616a
    bright2=a3be8c
    bright3=ebcb8b
    bright4=81a1c1
    bright5=b48ead
    bright6=8fbcbb
    bright7=eceff4
  '';
in {
  programs.foot.enable = true;
  home = {
    file.".config/foot/foot.ini".text = cfg;
    packages = with pkgs; [nerd-fonts.jetbrains-mono];
  };
}
