#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "================================"
echo "MBrainz Data Import Pipeline"
echo "================================"
echo ""

echo "Step 1: Cloning importer repository..."
"$SCRIPT_DIR/clone-importer.sh"
echo ""

echo "Step 2: Setting up configuration..."
"$SCRIPT_DIR/setup-config.sh"
echo ""

echo "Step 3: Running import (this may take a while)..."
"$SCRIPT_DIR/run-import.sh"
echo ""

echo "Step 4: Testing database connection..."
"$SCRIPT_DIR/test-connection.sh"
echo ""

echo "Step 5: Creating archive..."
"$SCRIPT_DIR/create-archive.sh"
echo ""

echo "Step 6: Creating GitHub release..."
"$SCRIPT_DIR/create-release.sh"
echo ""

echo "================================"
echo "Pipeline completed successfully!"
echo "================================"
