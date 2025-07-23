#!/bin/bash

# Create necessary folders
mkdir -p temp lstmf

# Loop over all .tif files in tif/
for tif_file in tif/*.tif; do
    base=$(basename "$tif_file" .tif)
    box_file="box/$base.box"

    # Check if corresponding box file exists
    if [[ ! -f "$box_file" ]]; then
        echo "❌ Box file missing for $base, skipping."
        continue
    fi

    echo "📦 Processing: $base"

    # Copy files to temp/
    cp "$tif_file" temp/
    cp "$box_file" temp/

    # Run tesseract from temp/
    tesseract "temp/$base.tif" "temp/$base" --psm 6 lstm.train

    # Move generated .lstmf to lstmf/
    if [[ -f "temp/$base.lstmf" ]]; then
        mv "temp/$base.lstmf" "lstmf/$base.lstmf"
        echo "✅ Generated: lstmf/$base.lstmf"
    else
        echo "❌ Failed to generate: $base.lstmf"
    fi

    # Clean up temp
    rm -f temp/$base.*
done

