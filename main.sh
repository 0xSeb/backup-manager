#!/bin/bash

source ./.env

echo "Creating folder at /tmp/wdtempshare ..."
mkdir /tmp/wdtempshare
echo -e "\e[32m Folder created !\e[0m"

echo "Mounting share at /tmp/wdtempshare ..."

sudo mount -t cifs //192.168.1.150/Sebastien /tmp/wdtempshare -o username=sebastien,password=$SHARE_PASSWORD
echo -e "\e[32m Share mounted !\e[0m"

echo "Making a backup of keepass database ..."

backup_filename=$(date +'%Hh%M__%m-%d-%Y')

sudo cp $KEEPASS_DB_PATH /tmp/wdtempshare/backup/keepassxc/$backup_filename.kdbx

echo -e "\e[32m Backup of keepass database done !\e[0m"


echo "Umounting share ..."
sudo umount /tmp/wdtempshare
echo -e "\e[32m Umounting done !\e[0m"

echo "Destroying folder /tmp/wdtempshare ..."
rmdir /tmp/wdtempshare
echo -e "\e[32m Destroying folder done !\e[0m"


echo -e "\e[32m #######################################\e[0m"
echo -e "\e[32m ##	BACKUP DONE ! 		     ##\e[0m"
echo -e "\e[32m #######################################\e[0m"

