FONT="Noto Nastaliq Urdu"

shopt -s nullglob

for file in kas1.training_txt/*; do
    echo "Found file: $file"

    base=$(basename "$file")
    outputbase="kas.exp1/$base.exp0"

    echo "Generating image for: $file → $outputbase"

    text2image \
        --text="$file" \
        --outputbase="$outputbase" \
        --font="$FONT" \
        --ptsize=32 \
        --max_pages=1 \
        --writing_mode=horizontal

    if [[ -f "${outputbase}.tif" && -f "${outputbase}.box" ]]; then
        mv "${outputbase}.tif" tif1/
        mv "${outputbase}.box" box1/
        echo "✅ Moved .tif and .box for $base"
    else
        echo "❌ Failed to generate .tif or .box for $base"
    fi
done
