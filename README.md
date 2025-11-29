# Installation
These are some notes for myself to recreate this Arch install

Steps to install Arch and all the packages and stow all the dot files.
- Install the Arch iso and install it onto a usb drive with rufus
- boot into the arch install
    - `iwctl` ENTER `station wlan0 get-networks` to show available networks. `exit` to exit
    - `iwctl --passphrase "password" station wlan0 connect network-ssid` to connect to a network
    - `ip addr show` to check if you were able to get an IP
    - `archinstall` to start the installation and follow the prompts
    - If you are installing on the entire partition you can just use the "best effort install"
    - If you are doing a dual boot you should create a new partition before starting install that you want to use for Arch
        - create a `/boot` partition that is 1GB `fat32` and a `/` partition in `ext4` format
    - Make sure to create a user with superuser access and opt for "Network Manager" for the network interface
- Reboot and remove the installation media and boot into the arch install. (boot into shell so you can actually see on the surface pro)
- Connect to internet with network manager
    - `sudo systemctl enable NetworkManager.service` and `sudo systemctl start NetworkManager.service` to make sure nmcli is active
    - `nmcli radio wifi on` to turn on wifi. `nmcli device wifi list` to show networks. `sudo nmcli device wifi connect <network-ssid> password <password>` to connect
- Use `pacman -S` to install `git`,`github-cli` and `stow`
- Use github-cli to authenticate connection with `gh auth login` (you will have to enter the link on another device to authenticate)
- Run the package installation script in the `dotfiles/scripts` folder
- Make sure you are in the home directory and clone the dotfiles repo with `gh repo clone kagethelephant/dotfiles`
- CD into the dotfiles folder and use `stow <folder-name>` for each of the folders
    - you might get an error that there are already files in the directory. use `stow <floder-name> --adopt` to replace those files with symlinks.
    - This will move the existing files into the repo. to keep the files from get use `git restore .` to return restore the git files
- `sudo systemctl enable cronie.service` and `sudo systemctl start NetworkManager.service` to start cronie for notification cron job
- `crontab -e` to edit cronjobs and add `*/5 * * * * /home/kage/bin/batteryNotify` to the file and save. Battery notifiacation should show up now
- Reboot into i3 and everything should be back to normal!


        

# Packages
## Need Packages
- Network Manager - On arch install
- Gparted - pacman (gparted)
- Python - pacman (python3) - UAR for specific version (python321)
- npm - pacman (npm)
- Firefox - pacman (firefox)
- Git - pacman (git)
- less (needed for git graph) - pacman(less)
- GitHub CLI - pacman (github-cli)
- Plocate - pacman (plocate) *run `sudo updatedb` before using*
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
- Ranger - (simple CLI file manager) pacman (ranger) 
- Ly Greeter - on arch install
- Rofi - pacman (rofi)
- Kitty (need to clone kitty themes) - pacman (kitty)
- Fast Fetch - pacman (fastfetch)
- Polybar - pacman (polybar)
- GNU Stow - pacman (stow)


# General Notes

## Crash Fix
- "xset -dpms" and "xset s off" to prevent freezing on sleep (these change x window settings)

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

`*/5 * * * * /home/kage/bin/batteryNotify` paste this in to crontab -e


