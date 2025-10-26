#!/bin/bash
set -euo pipefail

echo "Testing database connection..."
clojure -M --eval "(require '[datomic.client.api :as d]) (def client (d/client {:server-type :datomic-local :system \"mbrainz\"})) (d/connect client {:db-name \"mbrainz-1968-1973\"}) (shutdown-agents)"
echo "Connection test successful"
