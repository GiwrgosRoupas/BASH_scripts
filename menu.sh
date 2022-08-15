#menu

#!/bin/bash

while true 
do
	printf "\n**********\n"
	printf "\n1) Backup\n2) QR\n3) IP\n4) Quit!\n"
	printf "\n**********\n"
	read -n1 -s  answer
	
	case "$answer" in
		1)
		DATE=$(date +"%d-%m-%Y")
	  	cd $HOME && tar czf Documents-backup-$DATE.tar.gz Documents
	  	mv Documents-backup-$DATE.tar.gz /tmp
		printf "Backup successfully created!"
		;;

		2)
		echo "Give text to create QR code"
		read -e answer
		curl qrcode.show -d "$answer" -H "Accept: image/png" --output qr-file   
		mv qr-file /tmp
		;;

		3)
		ip=$(curl -s https://icanhazip.com)
		printf 'Your IP is %s' "$ip"
		;;

		4)
		echo "Bye bye..."
		exit 0 
		;;
	esac

done

