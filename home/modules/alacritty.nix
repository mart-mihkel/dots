let
  cfg = ''
    [env]
    TERM = "xterm-256color"

    [window]
    dynamic_padding = true
    opacity = 0.8

    [font]
    normal = { family = "Jetbrains Mono Nerd Font", style = "Regular" }
    size = 15

    [colors.primary]
    foreground = "#d8dee9"
    background = "#2e3440"

    [colors.cursor]
    text   = "#282828"
    cursor = "#eceff4"

    [colors.selection]
    text       = "#4c566a"
    background = "#eceff4"

    [colors.normal]
    black   = "#3b4252"
    red     = "#bf616a"
    green   = "#a3be8c"
    yellow  = "#ebcb8b"
    blue    = "#81a1c1"
    magenta = "#b48ead"
    cyan    = "#88c0d0"
    white   = "#e5e9f0"

    [colors.bright]
    black   = "#4c566a"
    red     = "#bf616a"
    green   = "#a3be8c"
    yellow  = "#ebcb8b"
    blue    = "#81a1c1"
    magenta = "#b48ead"
    cyan    = "#8fbcbb"
    white   = "#eceff4"
  '';
in {
  programs.alacritty.enable = true;
  home.file.".config/alacritty/alacritty.toml".text = cfg;
}
