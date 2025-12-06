# Installation
These are some notes to recreate my current arch install with dotfiles

Steps to install Arch, all necessary packages and stow all the dot files.
- Install the Arch iso and install it onto a usb drive with rufus
- boot into the arch install
    - `iwctl` ENTER `station wlan0 get-networks` to show available networks. `exit` to exit
    - `iwctl --passphrase "password" station wlan0 connect network-ssid` to connect to a network
    - `ip addr show` to check if you were able to get an IP
    - `archinstall` to start the installation and follow the prompts (use i3-wm and Ly greeter)
    - If you are installing on the entire partition you can just use the "best effort install"
    - If you are doing a dual boot you should create a new partition before starting install that you want to use for Arch
        - create a `/boot` partition that is 1GB `fat32` and a `/` partition in `ext4` format
    - Make sure you chose these options
        - Network Manager (under Network configuration)
        - PulseAudio (under Audio)
        - i3-wm and ly greeter (under Profile)
- Finish install, Reboot and remove the installation media to boot into the Arch. (if you have a high res display, login to shell. i3 will be too small to read)
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
- if this is going to be used on a microsoft surface then you should turn off the suspend on lid closed (and change power button to suspend)
    - Modify the `/etc/systemd/logind.conf` file and and change the following
        - `HandlePowerKey=suspend`
        - `HandleLidSwitch=ignore`
        - `HandleLidSwitchExternalPower=ignore`
- Reboot into i3 and everything should be setup!



# Packages

## Installed manually
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
- Meslo nerd font - used for UI because it has more unicode characters
- jetbrains nerd font - Font I use for kitty (I like the icons and font better for coding)
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
- dosfstools - can create and check MS DOS FAT filesystems
- bluez - bluetooth library
- bluez-utils - cli interface for bluez
- pulseaudio-bluetooth - bluetooth functionality for pulseaudio

## Optional Packages
- Yay - UAR - alternative package manager (needed for some libraries)
- libreOffice - pacman (libreoffice) - linux version of office
- ClamScan - pacman (clamav) - cli virus scanner
- Tree - pacman (tree) - file tree in terminal
- Python - pacman (python3)
- Ranger - pacman (ranger) - file explorer in terminal



# Controls

## i3
- `Win+space` open rofi (app drawer)
- `Win+enter` open terminal
- `Win` + `1234..` change workspace
- `Win+shift` + `1234..` move focused window to workspace
- `Win` + `hjkl` change focused window in workspace
- `Win+shift` + `hjkl` change focused window position in workspace
- `Win+shift+r` restart i3
- `Win+f` toggle full screen
- `Win+w` stacking window mode
- `Win+e` normal (split) window mode
- `Win+shift+q` quit focused window

## Firefox
- `ctrl+k` cursor to search bar
- `alt+left` back
- `alt+right` forward
- `ctrl+t` new tab
- `ctrl+n` new window
- `ctrl+tab` next tab
- `ctrl+shift+tab` last tab
- `ctrl+w` close current tab
- `ctrl+=` zoom in
- `ctrl+-` zoom out

## Terminal
- `ctrl+shift+c` copy
- `ctrl+shift+v` paste
- `ctrl+l` clear terminal
- `up` copy previous commands
- `ctrl+c` cancel current command


# General Notes

## CLI tools
- `cd <directory>` change directory
- `ls -a` list everything in directory
- `mkdir <new-directory>` create directory
- `rm -r <directory>` remove recursive (removes everything in directory)
- `touch <filename.ext>` create file
- `command | grep <number-of-outputs> <text-to-serch>` filters results of command by text match
- `sudo pacman -S <package>` to install pacman package
- `sudo pacman -Syu` system update (including packages)
- `sudo pacman -Runs <package>` remove the given package
- `tar -zxvf <filename>` will un-compress a tar file
- `ln -s <sourcedir> <targetdir` will make a symlink
- `sudo systemctl enable <service>` enable service
- `sudo systemctl start <service>` start service

## GIT
- `gh auth login` to authenticate github
- `gh repo clone username/repo` will clone a repo
- `gh repo create --source . --public` will create a new repo
- `gh browse` to open the repo in the current directory in github
- `git add .` add all changes to commit
- `git commit -m 'comment'` commit changes
- `git push` push commits
- `git pull` pull master
- `git restore .` restore all changes

## Network
- `nmcli radio wifi on` to turn on wifi
- `nmcli device wifi list` to show networks
- `nmcli device wifi connect <network-ssid> password <password>` to connect to wifi
- `bluetoothctl` start bluez-utils
    - `power on` turn on bluetooth radio
    - `scan on` turn on bluetooth scanning
    - `agent off` delete the active agent (determines how pairing is handled)
    - `agent NoOutputNoInput` this agent will allow you to bypass passcode for devices that do not input passcodes
    - `trust <MAC-ADDR>` makes it so the BT radio will find the device automatically
    - `pair <MAC-ADDR>` pairs with the device (if you cannot enter passcode change agent)
    - `connect <MAC-ADDR>` connects BT device
    - `remove <MAC-ADDR>` unpair device


### Create bootable meadia
use `sudo fdisk -l` to find your usb, `sudo umount /dev/drive` and `sudo mkfs.vfat /dev/drive` to format the drive (you will need `dosfstools`)
use `cat path/to/isofile > dev/disk/by-id/id-of-usb` to install the installation media

## Polybar
Polybar needs a special launch.rc (~/.config/polybar/launch.rc) file to ensure there is only one instance launched.
the i3 config file launches polybar using this file to insure they are not duplicated.

## Troubleshooting
- `journalctl` will show you the journal entries from the system
- `journalctl -p 3` show errors with a priority of 3 or greater
- `journalctl -b -p 3` filters for errors during boot
- The journal is cleared on reboot by default but you can modify `/etc/systemd/journald.conf` and edit storage to `#Storage=persistent

### Surface 7 freezing issue
If you find an error saying that the random seed file is world accessable you might have to change the permissions for the boot partition in the `/etc/fstab` file. Change values so `fmask=0137` and `dmask=0027`

On the microsoft surface devices, closing the lid might result in a `dptf_power INT3407:00: Unsupported event [0x82]` error in the journal. This will likely freeze the OS and the machine will have to be manually powered down. I could not find a fix for this so i just changed the arch power settings to prevent suspend on lid closed and change the power button to suspend instead of power down.
- To change power settings open `/etc/systemd/logind.conf` and edit the following
    - HandlePowerKey=suspend
    - HandleLidSwitch=ignore
    - HandleLidSwitchExternalPower=ignore

A combination of this and adding `exec --no-startup-id xset -dpms force off i` and `exec --no-startup-id xset s off` to the i3 config file to turn off display power management and screensaver for ACPI, seemed to fix the freezing issue on lid closed for the surface 7.
