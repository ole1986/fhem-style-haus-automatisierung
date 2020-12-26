#!/bin/bash

rm controls_ha_theme.txt

echo "MOV ./www/hausautomatisierung-com/custom.js unused" >> controls_ha_theme.txt

find ./www -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' file;
do
    date=$(stat -c '%y' $file)
    size=$(stat -c '%s' $file)
    echo  "UPD $date $size $file" >> controls_ha_theme.txt
done

# Append to changelog
changes=$(git log -n 10 --reverse --pretty="format:- %s")
echo -e "$(date +'%Y-%m-%d')\n$changes\n$(cat CHANGELOG)" > CHANGELOG
