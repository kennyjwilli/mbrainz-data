# MBrainz Data Importer

This repository automates the process of importing MusicBrainz data (1968-1973 subset) into a Datomic database and creating GitHub releases with the resulting database archive.

## Overview

The repository contains modular bash scripts that:
1. Clone the [mbrainz-importer](https://github.com/Datomic/mbrainz-importer) repository
2. Configure Datomic Local settings
3. Import the MusicBrainz data subset
4. Test the database connection
5. Create a zip archive of the database
6. Upload the archive as a GitHub release

## Prerequisites

To run locally, you need:
- Java 21 (Zulu distribution recommended)
- Clojure CLI (1.12.1.1550 or compatible)
- GitHub CLI (`gh`) - for creating releases
- `zip` utility

## Scripts

All scripts are located in the `scripts/` directory:

### Individual Scripts

- **clone-importer.sh** - Clones the mbrainz-importer repository
- **setup-config.sh** - Creates configuration files:
  - `mbrainz-importer/config/manifest.edn` - Import manifest
  - `~/.datomic/local.edn` - Datomic Local configuration
- **run-import.sh** - Executes the Clojure importer (may take significant time)
- **test-connection.sh** - Verifies database connection
- **create-archive.sh** - Creates `mbrainz.zip` from `$HOME/datomic-local/mbrainz`
- **create-release.sh** - Uploads archive as GitHub release with timestamp tag

### Master Script

- **run-all.sh** - Executes all scripts in sequence

## Running Locally

Make scripts executable:
```bash
chmod +x scripts/*.sh
```

Run the entire pipeline:
```bash
./scripts/run-all.sh
```

Or run individual steps:
```bash
./scripts/clone-importer.sh
./scripts/setup-config.sh
# ... etc
```

## GitHub Action

The workflow (`.github/workflows/import-mbrainz.yml`) automatically runs on push to `main` branch.

It:
- Sets up Java 21 and Clojure CLI
- Caches Clojure dependencies
- Runs the complete import pipeline
- Creates a timestamped release (e.g., `release-20251026-143022`)

The action uses the repository's `GITHUB_TOKEN` to create releases, so no additional secrets are needed.

## Database Location

The Datomic database is stored at `$HOME/datomic-local/mbrainz/` by default.
