#!/bin/bash

	root=$(df -BM / 2>/dev/null | awk 'FNR==2 {print substr($3, 1, length($3)-1)}')
	home=$(du -s -BM $HOME 2>/dev/null | awk '{print substr($1, 1 ,length($1)-1)}' )


	root=$(df -BG / 2>/dev/null | awk 'FNR==2 {print $3}')
	root_human_used=$(df -BG / 2>/dev/null | awk 'FNR==2 {print $3}')
	root_human_avail=$(df -BG / 2>/dev/null | awk 'FNR==2 {print $4}')
	home_human=$(du -sh $HOME 2>/dev/null | awk '{print $1}')
	echo "Root filesystem size is: $root_human_used ( out of $root_human_avail)"
	echo "Home directory size is: $home_human "
	
	percentage_used=$(echo  "scale=1; ($home/$root) " | bc)
	echo "Home directory uses $percentage_used% of /"

	#To divide with available space change
	#line 4: $3-->$4
