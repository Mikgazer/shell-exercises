#!/bin/bash
#verifica argomenti

if test $# -lt 2 
    then
        echo "Uso corretto: trova.sh nomedirectory nome file"
        exit 1 
fi

dir=$1
if test $dir ! -d 
    then    
        echo "Il primo parametro deve essere un direttorio"
        exit 2
fi

file=$2
if test $file ! -f 
    then
        echo "Il secondo parametro deve essere un file"
        exit 3
fi
    
PATH=$PATH:`pwd` #aggiunge directory script corrente al path
export PATH

if test -x "$dir"
then
    for in in *
    do
        if test -d "$i"
        then 
            trova "`pwd`"/"$i" "$file"
        else
            if test -f "$i" -a "$i" = "$file"
            then
                echo `pwd`/$i
            fi
        fi
    done
