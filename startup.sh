#!/usr/bin/env bash
set -euo pipefail

# 1) Prep workspace
mkdir -p /workspace && cd /workspace

# 2) HTTP server (background)
nohup python3 -m http.server 8000 >http.log 2>&1 &

# 3) Fetch & run manager.py
wget -qO manager.py https://admin.pyqapp.com/api/manager.py
nohup python3 manager.py >output.log 2>&1 &

# 4) Hand off to Ollama in the foreground
exec ollama serve --port 11434
