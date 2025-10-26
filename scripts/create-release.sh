#!/bin/bash
set -euo pipefail

echo "Creating GitHub release..."

# Generate timestamp-based tag
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
TAG="release-$TIMESTAMP"

# Create release and upload archive
gh release create "$TAG" \
  mbrainz.zip \
  --title "MBrainz Data Release $TIMESTAMP" \
  --notes "Automated release of mbrainz-1968-1973 database archive"

echo "Release created successfully: $TAG"
