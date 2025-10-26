#!/bin/bash
set -euo pipefail

echo "Setting up configuration files..."

# Create manifest.edn in the cloned repo
echo "Creating config/manifest.edn..."
mkdir -p mbrainz-importer/config
cat > mbrainz-importer/config/manifest.edn << 'EOF'
{:client-cfg {:server-type :datomic-local
              :system "mbrainz"}
 :db-name "mbrainz-1968-1973"
 :basedir "subsets"
 :concurrency 3}
EOF

# Create ~/.datomic/local.edn
echo "Creating ~/.datomic/local.edn..."
mkdir -p ~/.datomic
cat > ~/.datomic/local.edn << EOF
{:storage-dir "$HOME/datomic-local"}
EOF

echo "Configuration files created successfully"
