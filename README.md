# Dotfiles
My dotfiles

## Software installation
`yay -S hyprland hyprsome hyprlock hypridle wofi waybar xdg-desktop-portal-gtk xdg-desktop-portal-hyprland qt5ct qt6ct kvantum kvantum-qt5 nwg-look`

## Themes used
GTK: [Materia Transparent](https://github.com/ckissane/materia-theme-transparent)
QT (with Kvantum): [Nordic Dark](https://store.kde.org/p/1326272/) (Allow transparency in Kvanum Manager)

## Autologin
I recommend enabling autologin, since hyprlock will automatically start on login.

`sudo systemctl edit getty@tty1`
`[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin yourusername --noclear %I $TERM`
`sudo systemctl enable getty@tty1`

This should be in `.zshrc`:
`if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  Hyprland
fi`

Make sure this is in `~/.config/hypr/hyprlock.conf`
`exec-once = hyprlock`
