#!/bin/bash

est=$1
dirSorgente=$2
dirDestinazione=$3

cd "$dirSorgente"

for i in *$est
do
    if test -f "$i" -a ! -f "$dirDestinazione/$i"
    then 
        cp "$i" "$dirDestinazione/$i"
        echo "Copia di $i"
    fi
done

for i in *
do
    if test -d "$i" -a -x "$i"
    then
        esame_rec "$est" "$dirSorgente/$i" "$dirDestinazione"
    fi
done

