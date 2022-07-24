#!/usr/bin/zsh
srcExt=$1
destExt=$2

srcDir=$3
destDir=$4

for filename in "$srcDir"/*.$srcExt; do

        basePath=${filename%.*}
        baseName=${basePath##*/}

        ffmpeg -i "$filename" "$destDir""$baseName"."$destExt"
done

echo "Conversion from ${srcExt} to ${destExt} complete! "
