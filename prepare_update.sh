#!/bin/bash

rm controls_ha_theme_ole1986.txt

echo "MOV ./www/hausautomatisierung-com/custom.js unused" >> controls_ha_theme_ole1986.txt

find ./www -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' file;
do
    date=$(stat -c '%y' $file)
    size=$(stat -c '%s' $file)
    echo  "UPD ${date:0:10}_${date:11:8} $size ${file//.\//}" >> controls_ha_theme_ole1986.txt
done

NEXT=$(date +%F -d "+1 day")
echo "CHANGELOG" > CHANGED
echo "----------------------" >> CHANGED
git log --no-merges --format="%cd" --date=short | sort -u -r | while read DATE ; do
    echo
    echo [$DATE] >> CHANGED
    git log --no-merges --format=" * %s" --since="$DATE 00:00:00" --until="$NEXT 00:00:00" >> CHANGED
    echo "" >> CHANGED
    NEXT=$DATE
done