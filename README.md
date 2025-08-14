# Dotfiles
My dotfiles

## Software installation
```
yay -S hyprland hyprsome hyprlock hypridle hyprpaper hyprpicker wofi waybar dunst pavucontrol neovim slurp grim pipewire wireplumber pipewire-pulse xdg-desktop-portal-gtk xdg-desktop-portal-hyprland qt5ct qt6ct kvantum kvantum-qt5 nwg-look
```
If you are on a laptop, follow this guide to add touchpad support:
[Hyprgrass](https://github.com/horriblename/hyprgrass)

## Themes used
GTK: [Materia Transparent](https://github.com/ckissane/materia-theme-transparent)  
QT (with Kvantum): [Nordic Dark](https://store.kde.org/p/1326272/) (Allow transparency in Kvantum Manager)

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

Make sure this is in `~/.config/hypr/hyprland.conf`:

```
exec-once = hyprlock
```

## Monitor setup
Create `~/.config/hypr/monitors.conf` with the monitors config, for example:
```
monitor=DP-6, 1920x1080@144, 0x0, 1
```
You can view instructions on how to get your monitor ID [here](https://wiki.hyprland.org/Configuring/Monitors/)
