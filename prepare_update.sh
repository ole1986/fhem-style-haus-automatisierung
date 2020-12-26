#!/bin/bash

rm controls_ha_theme.txt

echo "MOV ./www/hausautomatisierung-com/custom.js unused" >> controls_ha_theme.txt

find ./www -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' file;
do
    date=$(stat -c '%y' $file)
    size=$(stat -c '%s' $file)
    echo  "UPD $date $size $file" >> controls_ha_theme.txt
done

NEXT=$(date +%F -d "+1 day")
echo "CHANGELOG" > CHANGELOG
echo "----------------------" >> CHANGELOG
git log --no-merges --format="%cd" --date=short | sort -u -r | while read DATE ; do
    echo
    echo [$DATE] >> CHANGELOG
    git log --no-merges --format=" * %s" --since="$DATE 00:00:00" --until="$NEXT 00:00:00" >> CHANGELOG
    echo "" >> CHANGELOG
    NEXT=$DATE
done