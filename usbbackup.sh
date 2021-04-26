#!/bin/bash
#
#-----------------------------------------------------------------------
#
# Script to backup all needed data upon USB hard disk insertion
# It is called thru UDEV with :
#  - the device name (sda1, ...) given as the first parameter
#
#-----------------------------------------------------------------------

# Log beggining of backup
/usr/bin/logger Log Transfer - Started on `date`
# if needed, create the mount directory "Security_Logs". You can change it to anything.
if [ ! -d /mnt/Security_Logs ] ; then mkdir /mnt/Security_Logs ; fi

# if your backup disk is formatted in ext2 or ext3, use following line to mount the backup disk
#/bin/mount -t auto /dev/$1 /mnt/whatever_name

# or if your backup disk is formatted in FAT32 as is the case with mine, use following line to mount the backup disk
/bin/mount -t vfat -o shortname=mixed,iocharset=utf8 /dev/$1 /mnt/flash

# Backup command using RSync (change "logs" to the name of folder to copy files from to usb drive)
# Everything in "logs" will be copied to "name of folder on usb drive"
/usr/bin/logger Backup - Logs
/usr/bin/rsync -rtv --del --modify-window=2 /home/hallowdance/documents/articles/Jan2021 /mnt/flash

# You can add other files to be transfered to the same usb disk.
#/usr/bin/logger Backup - other files
#/usr/bin/rsync -rtv --del --modify-window=2 /path/to/your/files/whatever_name /mnt/whateve_name
# force sync of files to disk before unmounting
/bin/sync

# unmount the usb disk
/bin/umount /mnt/logs

# Log end of file transfers to usb disk
/usr/bin/logger Log Transfer - Ended on `date`
