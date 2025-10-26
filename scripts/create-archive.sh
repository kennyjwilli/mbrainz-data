#!/bin/bash
set -euo pipefail

echo "Creating zip archive of datomic-local/mbrainz..."
cd "$HOME/datomic-local"
zip -r mbrainz.zip mbrainz
cd -
mv "$HOME/datomic-local/mbrainz.zip" ./mbrainz.zip
echo "Archive created: mbrainz.zip"
