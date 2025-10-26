#!/bin/bash
set -euo pipefail

echo "Cloning mbrainz-importer repository..."
git clone https://github.com/kennyjwilli/mbrainz-importer.git
cd mbrainz-importer
git checkout datomic-local
cd ..
echo "Successfully cloned mbrainz-importer and checked out datomic-local branch"
