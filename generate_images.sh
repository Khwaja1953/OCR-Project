#!/bin/bash

# Create output folders if they don't exist
mkdir -p kas.exp0 tif box

FONT="Noto Nastaliq Urdu"

shopt -s nullglob

for file in kas.training_txt/*; do
    echo "Found file: $file"

    base=$(basename "$file")
    outputbase="kas.exp0/$base.exp0"

    echo "Generating image for: $file → $outputbase"

    text2image \
        --text="$file" \
        --outputbase="$outputbase" \
        --font="$FONT" \
        --ptsize=32 \
        --max_pages=1 \
        --writing_mode=horizontal

    if [[ -f "${outputbase}.tif" && -f "${outputbase}.box" ]]; then
        mv "${outputbase}.tif" tif/
        mv "${outputbase}.box" box/
        echo "✅ Moved .tif and .box for $base"
    else
        echo "❌ Failed to generate .tif or .box for $base"
    fi
done
   
