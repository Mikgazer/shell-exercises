#!/bin/bash
dir=$1

cd "$dir"
counter=0
    
for i in .txt
do
    if test -f "$i" -a -w "$i"
    then
        if test -z `head -n 1 $i | grep preliminare`    
        then
            echo "`pwd`/$i è preliminare"
            rm -f $i
            counter=`expr $counter +1`
        else 
            echo "`pwd`/$i è definitivo"
        fi
    fi
done

if test $counter -gt `cat /tmp/max_counter`
then
    echo $counter > max_counter
    echo `pwd` > max_dirname
fi

for d in *
do
    if test -d "$d" -a -x "$d"
    then
        delete_preliminary_versions_aux.sh "$d"
    fi
done 
