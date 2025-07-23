#!/bin/bash

# Define source and target folders
BOX_DIR="box"
TARGET_FOLDER="data/unicharset"
UNIC_FILE="$TARGET_FOLDER/unicharset"

# Check for .box files
box_files=($BOX_DIR/*.box)
if [ ${#box_files[@]} -eq 0 ]; then
    echo "❌ No .box files found in $BOX_DIR"
    exit 1
fi

# Create data/unicharset directory if it doesn't exist
if [ ! -d "$TARGET_FOLDER" ]; then
    mkdir -p "$TARGET_FOLDER"
    echo "📁 Created folder: $TARGET_FOLDER"
elif [ -f "$UNIC_FILE" ]; then
    echo "⚠️ File $UNIC_FILE already exists. Not overwriting."
    exit 1
fi

# Generate unicharset
echo "🔤 Generating unicharset from $BOX_DIR/*.box ..."
unicharset_extractor $BOX_DIR/*.box

# Move the unicharset file
if [[ -f unicharset ]]; then
    mv unicharset "$UNIC_FILE"
    echo "✅ unicharset saved to $UNIC_FILE"
else
    echo "❌ Failed to generate unicharset"
fi
