#!/bin/sh

#riordina_foto.sh dir_sorgente dir_destinazione

if test $# -ne 3 
then
    echo "Numero errato di argomenti"
    exit -1
fi

dir1=$1
case $1 in 
    *) if test ! -d $1 -o ! -x $1 
        then      
            echo "Il primo argomento non è una directory o non ho i diritti di accesso"
        fi;;
    /*) echo "Errore, il primo argomento deve essere un nome relativo di directory";;  
esac
    
dir2=$2
case $2 in 
    *) if test ! -d $2 -o ! -x $2
        then      
            echo "Il secondo argomento non è una directory o non ho i diritti di accesso"
        fi;;
    /*) echo "Errore, il secondo argomento deve essere un nome relativo di directory";;
esac

#creo la directory duplicati
if test ! -d "$2/duplicati"
then 
    mkdir $2/duplicati
fi

export PATH=$PATH:`pwd`
foto_ric.sh $1 `pwd`/$2

echo "Numero di file spostati: `cat spostati $1 $2 | wc -l`"
rm -f spostati
