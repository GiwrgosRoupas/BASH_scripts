# Shows how much storage does $HOME use and stores it in ~/.hd_size
#

#!/bin/bash

du -hs --time $HOME >>.hd_size 2>/dev/null



