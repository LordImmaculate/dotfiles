# Dotfiles
My dotfiles

## Software installation
```
TBD (Fedora Switch)
```

## Themes used
GTK: [adw-gtk3-theme](https://github.com/lassekongo83/adw-gtk3) (DNF)  

## Autologin
I recommend enabling autologin, since hyprlock will automatically start on login.

```
sudo systemctl edit getty@tty1
```

```
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin {yourusername} --noclear %I $TERM
```

```
sudo systemctl enable getty@tty1
```

This should be in `.zshrc`:

```
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  hyprland
fi
```

Make sure this is in `~/.config/hypr/autostarts.conf`:

```
exec-once = hyprlock
```

## Monitor setup
Create `~/.config/hypr/monitors.conf` with the monitors config, for example:
```
monitor=DP-6, 1920x1080@144, 0x0, 1
```
You can view instructions on how to get your monitor ID [here](https://wiki.hyprland.org/Configuring/Monitors/)
