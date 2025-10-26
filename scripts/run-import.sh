#!/bin/bash
set -euo pipefail

echo "Running mbrainz importer..."
cd mbrainz-importer
clojure -M -m datomic.mbrainz.importer config/manifest.edn
cd ..
echo "Import completed successfully"
