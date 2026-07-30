#!/usr/bin/env sh
cd "$(dirname "$0")"
(command -v xdg-open >/dev/null && xdg-open http://localhost:3000) || (command -v open >/dev/null && open http://localhost:3000) || true
node server.js
