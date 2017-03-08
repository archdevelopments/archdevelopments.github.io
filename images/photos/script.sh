#!/bin/bash

rm ./workspace/*-resize.jpg
i=1
for f in `ls ./workspace/`; do
    echo "Processing: ${f}"

    if [ $i -le 9 ]; then name="0${i}.jpg"; else name="${i}.jpg"; fi

    # Resize image and output in ./workspace/
    convert "./workspace/${f}" -resize 20% "./workspace/${f}-resize.jpg"
    # Compress the image a bit
    convert "./workspace/${f}-resize.jpg" -quality 70 "./workspace/${f}-resize.jpg"

    # Copy the image to the correct directory
    cp "./workspace/${f}-resize.jpg" "../fulls/${name}"

    # Generate thumb
    convert "./workspace/${f}-resize.jpg" -quality 40 "../thumbs/${name}"

    i=$((i + 1))
done
