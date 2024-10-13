#!/usr/bin/env bash

read -p "WARNING: This script will completely wipe your boot partition to switch to using grub. Without switching to grub, some manual editing of configs will be required to use systemd-boot. Wipe boot partition? (y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
	read -p "Are you really sure? (y/n)" -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sudo rm -rf /boot/*
		echo removed
	fi
fi

echo Building system...

./rebuild.sh
echo Done!

echo Creating directories...

mkdir -p ~/vaults/misc
mkdir -p ~/.config/secrets

echo Done!

read -p "System is finished setting up. Reboot? (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	systemctl reboot
fi


echo If you need to switch to systemd boot, look at system/configuration.nix .
