#!/bin/bash

echo "Inserire una stringa"
   read stringa

 
if test $stringa -f 
   echo " $stringa e' un file"  
   exit 2
fi

if test $file -d
   echo " $stringa e' un direttorio"
   exit 3
fi

exit 4
