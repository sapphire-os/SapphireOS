#!/bin/bash

set -e -u

sed -i 's/#/(en_us\.UTF-8)/\1/' /etc/locale.gen
locale-gen

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i -'s/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist

systemctl enable lightdm
systemctl set-default graphical.target
systemctl enable NetworkManager
