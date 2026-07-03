#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 NVIDIA CORPORATION & AFFILIATES
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

export NVIDIA_BASE_URL="${NVIDIA_BASE_URL:-https://integrate.api.nvidia.com/v1}"

jupyter labextension disable "@jupyterlab/apputils-extension:announcements" || true

exec jupyter lab \
    --ip=0.0.0.0 \
    --port=8888 \
    --allow-root \
    --no-browser \
    --ServerApp.root_dir=/dli/tutorials \
    --IdentityProvider.token="${JUPYTER_TOKEN:-}"
