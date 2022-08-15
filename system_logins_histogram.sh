#!/bin/bash

logins=$(last -F | awk 'NR %2==0 {print $9"-"$6"-"$7} ' | head -n -2 | uniq -c)
printf '%s' "$logins" | awk '{print $2 ; for (count=o; count<$1; count++) printf "*"; print "\n"}'


