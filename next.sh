#!/bin/bash
#

coders=" etienne.charignon@gmail.com pascal@grange.nom.fr luc@mazardo.com cbegot@gmail.com

i=0
for coder in ${coders}
do
   if [ ${i} -eq 0 ]; 
   then
     echo "next is ${coder}"
     first=${coder}
     i=$((${i} + 1))
   else
     new_order="${new_order} ${coder}"
   fi
done
new_order="${new_order} $first"
echo ${new_order}

sed -i "s/${coders}/${new_order}/g" $0 
