#!/bin/bash

dir=$1

if test $# -ne 1
then
    echo "Errore: numero argomenti errato"
    exit 1
fi

case dir in
    /*) echo "Errore, il primo argomento deve essere un nome relativo di directory"
        exit -1 ;;
    *);;
esac

if test ! -d "$dir" -o ! -x "$dir"  
    then
        echo " Il primo argomento non è una directory o non ho i diritti di accesso"
fi

export PATH=$PATH:`pwd`
echo '0' > max_counter
echo > max_dirname

delete_preliminary_versions_aux.sh "$1"

echo "La cartella che conteneva il maggior numero di file cancellati è `cat max_dirname`"
