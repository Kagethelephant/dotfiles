# Packages
## Need Packages
- Network Manager - On arch install
- Gparted - pacman (gparted)
- Python - pacman (python3) - UAR for specific version (python321)
- npm - pacman (npm)
- NodeJs - pacman (nodejs)
- Firefox - pacman (firefox)
- Git - pacman (git)
- less (needed for git graph) - pacman(less)
- GitHub CLI - pacman (github-cli)
- Plocate - pacman (plocate) *run `sudo updatedb` before using*
- Ranger - (simple CLI file manager) pacman (ranger) 
- Grep - pacman (grep)
- CMake - pacman (cmake)
- LiveGrep - pacman (ripgrep)
- Zip and Unzip - pacman (zip unzip)
- dunst - pacman (dunst)
- libnotify (needed for dunst) - pacman (libnotify)
- cronie - pacman (cronie)
- acpi (used with dunst to get battery info) - pacman (acpi)
- Yay - UAR (check interwebs)
- Picom - pacman (picom)
- Xrandr - pacman (xorg-xrandr)
- Brightness control - pacman (brightnessctl)
- scrot (gets screenshots) - pacman (scrot)
- feh - pacman (feh)
- r - pacman (r)
- libreOffice - pacman (libreoffice)
- NeoVim - pacman (neovim)
- jetbrains nerd font - pacman (ttf-jetbrains-mono)
- XClip (clipboard provider needed for nvim) - pacman (xclip)
- ClamScan (virus scanning cli)- pacman (clamav)
- Tree (for terminal)

## Optional Packages
- Ly Greeter - on arch install
- Rofi - pacman (rofi)
- Kitty (need to clone kitty themes) - pacman (kitty)
- Fast Fetch - pacman (fastfetch)
- Polybar - pacman (polybar)
- GNU Stow - pacman (stow)


# General Notes
## Linux installation
If you are using a bootable USB drive make sure you do the custion partitioning and 
create a `/boot` directory with filesystem `fat32` (i dont actually know if this is the best file system) 
and a `/` directory with `ext4`

## Crash Fix
- "xset -dpms" and "xset s off" to prevent freezing on sleep

## Create bootable meadia
use `sudo fdisk -l` to show find your usb, `sudo umount /dev/drive` and `sudo mkfs.vfat /dev/drive` to format the drive (you will need `dosfstools`)
use ` cat path/to/isofile > dev/disk/by-id/id-of-usb` to install the installation media

## Polybar
Polybar needs a special launch.rc file to ensure there is only one instance launced.
The launch file will be started in the i3 config file with the other launch on i3 start programs

## Display and Brightness
You can set the display size in the i3 config file with xrandr, brightness in xrandr will
only adjust the gamma. You need to use brightnessCtl to adjust brightness

## Arch stuff
In arch its pacman instead of apt, for install `sudo pacman -S <package>`
to update use `sudo pacman -Syu` and remove `sudo pacman -Runs`

## Network Manager
Just putting a general note in here that "NetworkManager" is what is used to connect to wifi. In the command line it is called `nmcli`. You can connect to a nework with `nmcli dev wifi connect "network" password "password"`. You can check if wifi is disabled with `nmcli radio wifi` you can enable it with `nmcli radio wifi on`. You can use `nmcli dec wifi list` to show available networks. service for `systemctl` is called `NetworkManager.service`

## Terminal
`Ctrl + L` will clear the terminal
`tar -zxvf <filename>` will un-compress a tar file

## Github CLI
You can create a new GitHub repo from a git directory with gh_cli by running this command `gh repo create --source . --public`
you can also browse the repo in github with `gh browse`

## GNU Stow
you can create a symlink to a file using `ln -s <sourcedir> <targetdir>` and you can view links in the list function with `ls -l:`
type stow and the name of the folder to stow it. look at docummentation for folder structure. create a github repo to recreact config

## Notifications
You need to install a notification deamon (dunst) and a cron scheduler (cronie) to run the battery-notify script
this script will give a low battery warning. Remember to run `systemctl enable cronie` and `systemctl start cronie`
After you start cronie the first time it should add it to the systemd. You also need acpi to get the battery information.
dunst requires libnotify too to send notifications. You need to use crontab -e and to set the cron job for the script (made one in the bin of the stow file)
you might have to set the EDITER and VISUAL setings to nvim in your bashrc


