
#!/bin.bash
#controllo degli argomenti

if test $# != 3
    then
        echo "Sono necessari 3 argomenti"
        exit 
fi

est=$1
dirSorgente=$2
dirDestinazione=$3
case "$est" in 
    .*) ;;
    *) echo "Il primo argomento deve essere un'estensione, ovvero iniziare con un punto"
       exit 
esac

case "$dirSorgente" in 
    /*) ;;
    *) echo "Il secondo argomento deve essere una directory assoluta"
       exit 
esac

if test ! -d "$dirSorgente"
then
    echo "Errore, il secondo argomento non è una directory"
    exit 
fi

case "$dirDestinazione" in 
    /*) ;;
    *) echo "Il terzo argomento deve essere una directory assoluta"
       exit 
esac

#if test ! -d "$dirDestinazione"
#then
#    echo "Errore, il terzo argomento non è una directory"
#    exit 
#fi

PATH=$PATH:`pwd`
export PATH

echo "Sono stati copiati `esame_rec $est $dirSorgente $dirDestinazione | wc -l` files"

