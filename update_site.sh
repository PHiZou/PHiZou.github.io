#!/bin/bash

# Fail on any error
set -e

# Get today's date in the format used by the generator (YYYYMMDD_HHMMSS)
# We'll find the most recent video from today
TODAY=$(date +"%Y%m%d")
GENERATOR_BASE="/Users/peterhagen/Desktop/poem-short-generator-2/output"
# Find the most recent video from today
GENERATOR_OUTPUT=$(find "$GENERATOR_BASE" -type d -name "${TODAY}*" | sort -r | head -1)/video.mp4
DATE=$(date +"%Y-%m-%d")

REPO="/Users/peterhagen/Documents/GitHub/PHiZou.github.io"
TARGET="$REPO/public/projects/poem-generator/videos/$DATE.mp4"
PAGE="$REPO/src/content/projects/poem-generator.md"

# Check if source video exists
if [ ! -f "$GENERATOR_OUTPUT" ]; then
    echo "Error: Video not found at $GENERATOR_OUTPUT"
    exit 1
fi

# 1. Copy video into GitHub Pages repo (public folder for Astro)
mkdir -p "$REPO/public/projects/poem-generator/videos"
cp "$GENERATOR_OUTPUT" "$TARGET"
echo "✓ Copied video to $TARGET"

# 2. Prepend entry to project page (newest videos on top)
# Create a temporary file with the new video entry
TEMP_FILE=$(mktemp)
cat > "$TEMP_FILE" << EOF

## $DATE

<video width="320" controls>
  <source src="/projects/poem-generator/videos/$DATE.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
EOF

# Insert the new entry right after the insertion point (newest first)
if grep -q "Under this header, we will append new video entries daily." "$PAGE"; then
    # Use awk to insert right after the line (newest videos appear first)
    awk -v insert="$(cat $TEMP_FILE)" '/Under this header, we will append new video entries daily./ {print; print insert; next}1' "$PAGE" > "${PAGE}.tmp" && mv "${PAGE}.tmp" "$PAGE"
    echo "✓ Added video entry to project page (newest first)"
else
    # Fallback: prepend to end of file
    {
        head -n -1 "$PAGE"
        cat "$TEMP_FILE"
        tail -n 1 "$PAGE"
    } > "${PAGE}.tmp" && mv "${PAGE}.tmp" "$PAGE"
    echo "✓ Prepended video entry to project page"
fi
rm "$TEMP_FILE"

# 3. Commit + push
cd "$REPO"
git add public/projects/poem-generator/videos/$DATE.mp4 src/content/projects/poem-generator.md
git commit -m "Daily AI poem generator video for $DATE"
git push

echo "✓ Successfully deployed video for $DATE"

