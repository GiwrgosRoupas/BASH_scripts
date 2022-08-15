#!/bin/bash

if (($# != 2))
then
	echo "Usage : ./it21988_ex_2.sh <path to directory> <size>"
	exit 1
fi

while IFS= read -r -d '' f <&3; do
        ls -sh "$f" 2>/dev/null
        rm -i -- "$f"  
done 3< <(find $1 -type f -size +$2 -print0 2> >(grep -v 'Permission denied' >&2))

