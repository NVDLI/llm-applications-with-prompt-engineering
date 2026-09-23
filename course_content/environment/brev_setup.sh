#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 NVIDIA CORPORATION & AFFILIATES
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
course_dir="$(cd -- "$script_dir/.." && pwd)"
venv_dir="$course_dir/.venv"

if ! python3 -c "import ensurepip" >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y python3-venv
fi

python3 -m venv --clear "$venv_dir"
"$venv_dir/bin/python" -m pip install --upgrade pip
"$venv_dir/bin/python" -m pip install -r "$script_dir/requirements.txt"

# Course notebooks request the conventional `python3` kernelspec. Register the
# isolated course environment under that name so every notebook selects it by
# default without requiring learners to change kernels manually.
"$venv_dir/bin/python" -m ipykernel install \
    --user \
    --name python3 \
    --display-name "Python 3 (Course)"

"$venv_dir/bin/python" -c \
    "from openai import OpenAI; import langchain, langgraph, gradio; print('Course environment is ready.')"
