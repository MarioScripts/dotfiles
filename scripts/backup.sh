#!/bin/sh

home="/home/matt"
backup="/home/matt/dotfiles-backup"

printf "\nBacking up:\n\ti3 directory"
cp -rf $home/.i3 $backup

printf "\n\t.fonts directory"
cp -rf $home/.fonts $backup

printf "\n\t.Xresources (URxvt config)"
cp $home/.Xresources $backup

printf "\n\txorg.conf (lightdm config)"
cp /etc/X11/xorg.conf $backup

printf "\n\tlemonbar scripts"
cp -rf $home/scripts $backup

printf "\n\t.bashrc"
cp $home/.bashrc $backup

printf "\nFinished.\n\n"
