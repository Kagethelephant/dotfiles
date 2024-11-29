# Packages
## Need Packages
- Network Manager
- Gparted
- Firefox
- Git
- GitHub CLI
- Plocate
- Grep
- LiveGrep
- Yay
- Picom 
- Xrandr
- Brightness ctl
- scrot
- feh 
- r (for a calculator)
- libreOffice
- NeoVim (need nerd font for most plugins)
- XClip
- Tree (for terminal)

## Optional Packages
- Ly Greeter
- Rofi
- Kitty 
- Fast Fetch
- Polybar 
- GNU Stow


# General Notes
## Linux installation
If you are using a bootable USB drive make sure you do the custion partitioning and 
create a `/boot` directory with filesystem `fat32` (i dont actually know if this is the best file system) 
and a `/` directory with `ext4`

## Crash Fix
- "xset -dpms" and "xset s off" to prevent freezing on sleep

## Polybar
Polybar needs a special launch.rc file to ensure there is only one instance launced.
The launch file will be started in the i3 config file with the other launch on i3 start programs

## Display and Brightness
You can set the display size in the i3 config file with xrandr, brightness in xrandr will
only adjust the gamma. You need to use brightnessCtl to adjust brightness

## Arch stuff
In arch its pacman instead of apt, for install `sudo pacman -S <package>`
to update use `sudo pacman -Syu` and remove `sudo pacman -Runs`

## Terminal
`Ctrl + L` will clear the terminal 

## Github CLI
You can create a new GitHub repo from a git directory with gh_cli by running this command `gh repo create --source . --public`
you can also browse the repo in github with `gh browse`

## GNU Stow
you can create a symlink to a file using `ln -s <sourcedir> <targetdir>` and you can view links in the list function with `ls -l:`


