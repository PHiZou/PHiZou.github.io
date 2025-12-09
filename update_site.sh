#!/bin/bash

# Fail on any error
set -e

DATE=$(date +"%Y-%m-%d")
GENERATOR_OUTPUT="/Users/peterhagen/Desktop/poem-short-generator2/output/$DATE/video.mp4"

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

# 2. Append entry to project page
# Create a temporary file with the new video entry
TEMP_FILE=$(mktemp)
cat > "$TEMP_FILE" << EOF

## $DATE

<video width="320" controls>
  <source src="/projects/poem-generator/videos/$DATE.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
EOF

# Append the new entry after the insertion point
if grep -q "Under this header, we will append new video entries daily." "$PAGE"; then
    # Use awk to insert after the line
    awk -v insert="$(cat $TEMP_FILE)" '/Under this header, we will append new video entries daily./ {print; print insert; next}1' "$PAGE" > "${PAGE}.tmp" && mv "${PAGE}.tmp" "$PAGE"
    echo "✓ Added video entry to project page"
else
    # Fallback: append to end of file
    cat "$TEMP_FILE" >> "$PAGE"
    echo "✓ Appended video entry to end of project page"
fi
rm "$TEMP_FILE"

# 3. Commit + push
cd "$REPO"
git add public/projects/poem-generator/videos/$DATE.mp4 src/content/projects/poem-generator.md
git commit -m "Daily AI poem generator video for $DATE"
git push

echo "✓ Successfully deployed video for $DATE"

