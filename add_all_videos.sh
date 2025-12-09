#!/bin/bash

# Script to add all existing videos to the website (newest first)
set -e

REPO="/Users/peterhagen/Documents/GitHub/PHiZou.github.io"
GENERATOR_BASE="/Users/peterhagen/Desktop/poem-short-generator-2/output"
PAGE="$REPO/src/content/projects/poem-generator.md"

# Find all date folders with videos, sort newest first
echo "Searching for videos..."
VIDEO_DIRS=$(find "$GENERATOR_BASE" -type d -name "20*" 2>/dev/null | sort -r)

if [ -z "$VIDEO_DIRS" ]; then
    echo "No video directories found in $GENERATOR_BASE"
    exit 1
fi

# Create videos directory
mkdir -p "$REPO/public/projects/poem-generator/videos"

# Process each video (newest first)
VIDEO_ENTRIES_FILE=$(mktemp)
VIDEO_COUNT=0

for DIR in $VIDEO_DIRS; do
    FOLDER_NAME=$(basename "$DIR")
    VIDEO_FILE="$DIR/video.mp4"
    
    if [ -f "$VIDEO_FILE" ]; then
        # Convert folder name format (20251209_082141) to date format (2025-12-09)
        # Extract date part (first 8 digits: YYYYMMDD)
        if [[ $FOLDER_NAME =~ ^([0-9]{4})([0-9]{2})([0-9]{2}) ]]; then
            YEAR=${BASH_REMATCH[1]}
            MONTH=${BASH_REMATCH[2]}
            DAY=${BASH_REMATCH[3]}
            DATE="$YEAR-$MONTH-$DAY"
        else
            # Fallback: use folder name as-is
            DATE="$FOLDER_NAME"
        fi
        
        echo "Processing video for $DATE (from folder $FOLDER_NAME)..."
        
        # Copy video
        cp "$VIDEO_FILE" "$REPO/public/projects/poem-generator/videos/$DATE.mp4"
        
        # Add to entries file (newest first, so prepend)
        {
            echo "## $DATE"
            echo ""
            echo "<video width=\"320\" controls>"
            echo "  <source src=\"/projects/poem-generator/videos/$DATE.mp4\" type=\"video/mp4\">"
            echo "  Your browser does not support the video tag."
            echo "</video>"
            echo ""
            cat "$VIDEO_ENTRIES_FILE"
        } > "${VIDEO_ENTRIES_FILE}.tmp"
        mv "${VIDEO_ENTRIES_FILE}.tmp" "$VIDEO_ENTRIES_FILE"
        
        VIDEO_COUNT=$((VIDEO_COUNT + 1))
    fi
done

if [ $VIDEO_COUNT -eq 0 ]; then
    echo "No videos found to process"
    rm "$VIDEO_ENTRIES_FILE"
    exit 1
fi

echo "Found $VIDEO_COUNT videos. Updating project page..."

# Create updated page content
TEMP_PAGE=$(mktemp)
# Find the insertion point and add video entries after it
while IFS= read -r line; do
    echo "$line"
    if [[ "$line" == *"Under this header, we will append new video entries daily."* ]]; then
        cat "$VIDEO_ENTRIES_FILE"
    fi
done < "$PAGE" > "$TEMP_PAGE"
mv "$TEMP_PAGE" "$PAGE"
rm "$VIDEO_ENTRIES_FILE"

# Commit and push
cd "$REPO"
git add public/projects/poem-generator/videos/*.mp4 src/content/projects/poem-generator.md
git commit -m "Add $VIDEO_COUNT daily AI poem generator videos (newest first)" || echo "No changes to commit"
git push

echo "✓ Successfully added $VIDEO_COUNT videos to the website (newest first)"

