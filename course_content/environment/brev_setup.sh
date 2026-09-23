#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 NVIDIA CORPORATION & AFFILIATES
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
course_dir="$(cd -- "$script_dir/.." && pwd)"
venv_dir="$course_dir/.venv"
brev_python="/home/ubuntu/.venv/bin/python"

if [[ -x "$brev_python" ]]; then
    base_python="$brev_python"
else
    base_python="$(command -v python3)"
    if ! "$base_python" -c "import ensurepip" >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install -y python3-venv
    fi
fi

"$base_python" -m venv --clear "$venv_dir"
"$venv_dir/bin/python" -m pip install --upgrade pip
"$venv_dir/bin/python" -m pip install -r "$script_dir/requirements.txt"

"$venv_dir/bin/python" -m ipykernel install \
    --user \
    --name oss-pe \
    --display-name "Python (Prompt Engineering)"

# Brev's managed Jupyter server synthesizes its native `python3` kernelspec,
# which takes precedence over a user kernelspec with the same name. When that
# managed environment is present, add the ABI-compatible course packages to
# its native kernel search path so the notebooks work without a kernel change.
if [[ -x "$brev_python" ]]; then
    course_abi="$("$venv_dir/bin/python" -c \
        "import sysconfig; print(sysconfig.get_config_var('SOABI'))")"
    brev_abi="$("$brev_python" -c \
        "import sysconfig; print(sysconfig.get_config_var('SOABI'))")"

    if [[ "$course_abi" != "$brev_abi" ]]; then
        echo "Course and Brev Python ABIs do not match." >&2
        exit 1
    fi

    course_site="$("$venv_dir/bin/python" -c \
        "import site; print(site.getsitepackages()[0])")"
    brev_site="$("$brev_python" -c \
        "import site; print(site.getsitepackages()[0])")"

    printf "import sys; sys.path.insert(0, '%s')\n" "$course_site" \
        > "$brev_site/nvidia_dli_prompt_engineering.pth"

    "$brev_python" -c \
        "from openai import OpenAI; import langchain, langgraph, gradio; print('Brev default kernel is ready.')"
fi

"$venv_dir/bin/python" -c \
    "from openai import OpenAI; import langchain, langgraph, gradio; print('Course environment is ready.')"
