#!/bin/bash
#move_file num dirSorgente dirDestinazione ext1 ext2 ... etxtN

if test $# -lt 4
    then
        echo "Sono necessari almeno 4 parametri"
        exit 1
fi

if test $1 ! -d 
    then
        echo "Il secondo parametro deve essere una directory"
        exit 1
fi

if test $#2 ! -d
    then
        echo "Il terzo parametro deve essere una directory"
        exit 1
fi

PATH=$PATH:`pwd`
export PATH

echo > counter.tmp


num=$1
dirSorgente=$2
dirDestinazione=$3
ricerca $num $dirsorgente $dirDestinazione | wc -l >> counter.tmp
