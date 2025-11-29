# Installation
These are some notes for myself to recreate this Arch install

Steps to install Arch and all the packages and stow all the dot files.
- Install the Arch iso and install it onto a usb drive with rufus
- boot into the arch install
    - `iwctl` ENTER `station wlan0 get-networks` to show available networks. `exit` to exit
    - `iwctl --passphrase "password" station wlan0 connect network-ssid` to connect to a network
    - `ip addr show` to check if you were able to get an IP
    - `archinstall` to start the installation and follow the prompts (use i3-wm and Ly greeter)
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
- Setup git info with `git config --global user.email "email"` and `git config --global user.name "name"`
- Run the package installation script in the `dotfiles/scripts` folder
- Make sure you are in the home directory and clone the dotfiles repo with `gh repo clone kagethelephant/dotfiles`
- CD into the dotfiles folder and use `stow <folder-name>` for each of the folders
    - you might get an error that there are already files in the directory. use `stow <floder-name> --adopt` to replace those files with symlinks.
    - This will move the existing files into the repo. to keep the files from get use `git restore .` to return restore the git files
- `sudo systemctl enable cronie.service` and `sudo systemctl start NetworkManager.service` to start cronie for notification cron job
- `crontab -e` to edit cronjobs and add `*/5 * * * * /home/kage/bin/batteryNotify` to the file and save. Battery notifiacation should show up now
- Reboot into i3 and everything should be back to normal!


        

# Packages

## Installed manually for install
- Network Manager - pacman (networkmanager)
- Git - pacman (git)
- GitHub CLI - pacman (github-cli)
- GNU Stow - pacman (stow)

## Installed through script
- Firefox - Browser
- Gparted - Partition manager
- less - Used to display things in the terminal (used for gitgraph)
- Zip and Unzip - zip and unzip packages
- Plocate - Used to find files by name in the terminal
- Grep - Library for finding text patterns
- LiveGrep - More effiecient grep (ripgrep)
- r - Statistics tool
- CMake - Used to build C based projects
- SFML - C++ graphics library
- jetbrains nerd font - Font I use for everythin
- npm - Node package manager, biggest package manager (used for neovim plugins)
- Kitty - Modern graphics accelerated terminal
- NeoVim - Terminal text editor with lua modules
- Xrandr - Used to modify X display settings
- Picom - Lightweight compositor so nice window effects like shadows
- Brightness control - Used to modify xrandr brightness settings
- feh - Image viewer (used to set wallpaper)
- XClip - clipboard for windows like copy and paste (also used by neovim)
- scrot - used to get screenshots
- Rofi - application drawer
- Polybar - nice looking status bar with lots of config options
- cronie - used to schedule cron jobs
- dunst - notification deamon
- libnotify - Sends notifications from system to notification deamon
- acpi - collects power info from system (used for battery notification and battery bar)
- Fast Fetch - gives system information in the terminal


## Optional Packages
- Yay - UAR - alternative package manager (needed for some libraries)
- libreOffice - pacman (libreoffice) - linux version of office
- ClamScan - pacman (clamav) - cli virus scanner
- Tree - pacman (tree) - file tree in terminal
- Python - pacman (python3)
- Ranger - pacman (ranger) - file explorer in terminal


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


