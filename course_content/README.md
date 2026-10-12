# Prompt Engineering Course Content

This directory contains the shared JupyterLab runtime and instructional
material for the course. A GPU is not required because model inference is
performed by the configured external API endpoint.

## Contents

```text
.
├── Dockerfile
├── environment/
│   ├── entrypoint.sh
│   └── requirements.txt
├── slides/
│   ├── FOR_OSRB_REVIEW.md
│   └── THIRD_PARTY_NOTICES.md
└── tutorials/
    ├── Workshop-Intro.ipynb
    ├── 1-Intro-to-Prompting/
    ├── 2-Chains/
    ├── 3-Prompting-With-Messages/
    ├── 4-Structured-Output/
    ├── 5-Tools/
    ├── 6-Conclusion/
    └── images/
```

## API key

Obtain an NVIDIA API key from <https://build.nvidia.com/explore/discover>.
`11-Nvidia-NIM.ipynb` walks through that step. Every notebook that calls the API
contains a normal setup cell and keeps the entered key only in that notebook
kernel's memory. The key is not supplied through Docker or written to a file,
so a new notebook kernel asks for it again.

## Run with Docker

```bash
docker build -t oss-pe .
docker run --rm -it -p 8888:8888 oss-pe
```

The default endpoint is `https://integrate.api.nvidia.com/v1`. The notebooks
also contain commented guidance for using an alternative OpenAI-compatible
endpoint. See the repository-level
[`README.md`](../README.md#use-another-openai-compatible-api-endpoint)
for how to change the base URL, credentials, and model IDs, and for
compatibility considerations.

## Run locally

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r environment/requirements.txt
jupyter lab tutorials
```
