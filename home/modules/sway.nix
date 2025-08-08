{pkgs, ...}: let
  cfg = ''
    set $wallpaper ~/Pictures/walls/opattern.png
    set $lockpaper ~/Pictures/walls/xpattern.png

    floating_modifier Mod4
    focus_follows_mouse yes

    gaps inner 12
    gaps outer 0

    default_border          pixel 2
    default_floating_border pixel 2

    client.urgent           #bf616a #bf616a #bf616a #bf616a #bf616a
    client.focused          #d8dee9 #d8dee9 #d8dee9 #d8dee9 #d8dee9
    client.focused_inactive #4c566a #4c566a #4c566a #4c566a #4c566a
    client.unfocused        #4c566a #4c566a #4c566a #4c566a #4c566a
    client.placeholder      #4c566a #4c566a #4c566a #4c566a #4c566a
    client.background       #4c566a

    input type:keyboard {
        xkb_layout  ee
        xkb_variant nodeadkeys

        repeat_rate  32
        repeat_delay 256
    }

    input type:touchpad tap enabled

    output eDP-1 background $wallpaper fill

    bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl s 2%-
    bindsym XF86MonBrightnessUp   exec --no-startup-id brightnessctl s +2%
    bindsym XF86AudioLowerVolume  exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
    bindsym XF86AudioRaiseVolume  exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
    bindsym XF86AudioMicMute      exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    bindsym XF86AudioMute         exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindsym XF86AudioPause        exec --no-startup-id playerctl play-pause
    bindsym XF86AudioPlay         exec --no-startup-id playerctl play-pause
    bindsym XF86AudioPrev         exec --no-startup-id playerctl previous
    bindsym XF86AudioNext         exec --no-startup-id playerctl next

    bindsym Control+Print         exec --no-startup-id grimshot --notify savecopy screen
    bindsym Mod1+Print            exec --no-startup-id grimshot --notify savecopy window
    bindsym Print                 exec --no-startup-id grimshot --notify savecopy area

    bindsym Mod4+Shift+c          exec --no-startup-id swaylock -u -i $lockpaper
    bindsym Mod4+r                exec --no-startup-id tofi-drun
    bindsym Mod4+q                exec --no-startup-id foot

    bindsym Mod4+f fullscreen toggle
    bindsym Mod4+v floating toggle
    bindsym Mod4+c kill

    bindsym Mod4+Shift+r reload
    bindsym Mod4+Shift+e exit

    bindsym Mod4+h focus left
    bindsym Mod4+j focus down
    bindsym Mod4+k focus up
    bindsym Mod4+l focus right

    bindsym Mod4+Shift+h move left
    bindsym Mod4+Shift+j move down
    bindsym Mod4+Shift+k move up
    bindsym Mod4+Shift+l move right

    bindsym Mod4+1 workspace number 1
    bindsym Mod4+2 workspace number 2
    bindsym Mod4+3 workspace number 3
    bindsym Mod4+4 workspace number 4
    bindsym Mod4+5 workspace number 5
    bindsym Mod4+6 workspace number 6
    bindsym Mod4+7 workspace number 7
    bindsym Mod4+8 workspace number 8
    bindsym Mod4+9 workspace number 9
    bindsym Mod4+0 workspace number 10

    bindsym Mod4+Shift+1 move container to workspace number 1
    bindsym Mod4+Shift+2 move container to workspace number 2
    bindsym Mod4+Shift+3 move container to workspace number 3
    bindsym Mod4+Shift+4 move container to workspace number 4
    bindsym Mod4+Shift+5 move container to workspace number 5
    bindsym Mod4+Shift+6 move container to workspace number 6
    bindsym Mod4+Shift+7 move container to workspace number 7
    bindsym Mod4+Shift+8 move container to workspace number 8
    bindsym Mod4+Shift+9 move container to workspace number 9
    bindsym Mod4+Shift+0 move container to workspace number 10

    exec --no-startup-id autotiling
    exec --no-startup-id gammastep
    exec --no-startup-id waybar
    exec --no-startup-id dunst
  '';
in {
  home = {
    file".config/sway/config".text = cfg;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      brightnessctl
      wireplumber
      noto-fonts
      autotiling
      playerctl
      grimshot
      sway
      tofi
    ];
  };
}
