#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")" && pwd)"
python_bin="$repo_root/.venv/bin/python"
venv_bin_dir="$repo_root/.venv/bin"
venv_jupyter_dir="$repo_root/.venv/share/jupyter"

if [[ ! -x "$python_bin" ]]; then
  echo "Error: expected Python interpreter at $python_bin" >&2
  echo "Create the local virtual environment and install dependencies first." >&2
  exit 1
fi

export QUARTO_PYTHON="$python_bin"
export PATH="$venv_bin_dir:$PATH"
export JUPYTER_PATH="$venv_jupyter_dir${JUPYTER_PATH:+:$JUPYTER_PATH}"

cd "$repo_root"
exec quarto render "$@"