#!/bin/bash

FHEM_DIR=/opt/fhem

if [ "$1" == "clean" ]
then
    rm $FHEM_DIR/www/hausautomatisierung-com
    rm $FHEM_DIR/www/images/hausautomatisierung_com
    for s in $PWD/www/pgm2/hausautomatisierung_com*
    do
        [ -L  $FHEM_DIR/www/pgm2/$(basename $s) ] && rm $FHEM_DIR/www/pgm2/$(basename $s)
    done
    echo "Removed project links from fhem directory"
    exit
fi



[ ! -L $FHEM_DIR/www/hausautomatisierung-com ] && sudo rm -rf $FHEM_DIR/www/hausautomatisierung-com && sudo ln -s $PWD/www/hausautomatisierung-com $FHEM_DIR/www/hausautomatisierung-com
[ ! -L $FHEM_DIR/www/images/hausautomatisierung_com ] && sudo rm -rf $FHEM_DIR/www/images/hausautomatisierung_com && sudo ln -s $PWD/www/images/hausautomatisierung_com $FHEM_DIR/www/images/hausautomatisierung_com

for s in $PWD/www/pgm2/hausautomatisierung_com*
do
    [ ! -L $FHEM_DIR/www/pgm2/$(basename $s) ] && sudo rm -f $FHEM_DIR/www/pgm2/$(basename $s) && sudo ln -s $s $FHEM_DIR/www/pgm2/$(basename $s)
done
