#!/bin/bash 
#

source .coders

head=$(echo $coders | sed -e 's: .*::')
tail=$(echo $coders | sed -e 's:[^ ]* ::')

echo "coders=\"${tail} ${head}\"" > .coders

cat << EOF

Congratulations !!!
1. Commit what you have done (and what this script just did)
2. Push you local copy on github: git@github.com:cadavreexquis/cadavre_exquis.git
3. Send a kind mail to the next player to notify it is his turn : 

	${head}

EOF
