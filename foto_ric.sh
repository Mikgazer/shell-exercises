
#!/bin/sh

#foto_ric.sh dir_sorgente dir_destinazione

cd $1
count=1

for i in .JPG
    if test -f $i -a -r $i
    then
         
        if test -e $2/$i
        then 
            while test -e "$2/duplicati/$i-$count"
            do
                count=`expr count+1`
            done
            mv $i "$2/duplicati/$i-$count"
        else 
            mv $i "$2/$i"
            echo "$2/$i" >> spostati
        fi
    fi
done        
        
for d in *
    if test -d $d -a -x $d
    then
        foto_ric.sh $d $2   
fi
