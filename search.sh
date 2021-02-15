#!/bin/bash
#entrare nella cartella passata come parametro e, per ogni estensione

num=$1
dirSorgente=$2
dirDestinazione=$3

PATH=$PATH:`pwd`
export PATH 
cd /home/username
shift 3
for i in $*
    do  
        for file in "`ls *$i 2>/dev/null`"
        do
            if test -f $file
            then
                if test -r $file -a `wc -l < $i -gt` $num
                then
                    echo $file >> /tmp.counter.tmp
                    cp "$file" "$dirDestinazione"
                fi
            fi
        done
    done


for i in *
do
    if test -d $i 
    then
        if test -x $i
        then  
            ricerca $num "$dirSorgente" "$dirDestinazione" $*
        fi
    fi
done
exit 
