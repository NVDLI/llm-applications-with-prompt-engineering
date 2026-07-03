# SPDX-FileCopyrightText: 2026 NVIDIA CORPORATION & AFFILIATES
# SPDX-License-Identifier: Apache-2.0

FROM python:3.12.1-slim

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    SHELL=/bin/bash \
    PYTHONPATH=/dli/tutorials \
    NVIDIA_BASE_URL=https://integrate.api.nvidia.com/v1

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        git \
    && rm -rf /var/lib/apt/lists/*

COPY environment/requirements.txt /tmp/requirements.txt
RUN python -m pip install --upgrade pip \
    && python -m pip install -r /tmp/requirements.txt

WORKDIR /dli
COPY . .

WORKDIR /dli/tutorials

EXPOSE 8888

ENTRYPOINT ["/dli/environment/entrypoint.sh"]

