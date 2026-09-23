# Building LLM Applications With Prompt Engineering

Building LLM Applications With Prompt Engineering is an open-source,
hands-on NVIDIA Deep Learning Institute workshop. Learners use the
OpenAI-compatible NVIDIA API and LangChain to build prompt-driven applications,
structured-output pipelines, tools, and agents.

## Learning outcomes

In these labs, learners will:

- Call OpenAI-compatible NVIDIA model endpoints from Python
- Stream and batch model requests
- Design reusable prompts and LangChain Expression Language chains
- Work with system, human, and AI messages
- Apply few-shot, chain-of-thought, and iterative prompting techniques
- Generate and validate structured output with Pydantic
- Create tools and agents that incorporate external information

## Course modules

| # | Module | Starting notebook |
|---|---|---|
| 00 | Workshop introduction | [Workshop-Intro.ipynb](./course_content/tutorials/Workshop-Intro.ipynb) |
| 01 | Introduction to prompting | [10-Section-Introduction.ipynb](./course_content/tutorials/1-Intro-to-Prompting/10-Section-Introduction.ipynb) |
| 02 | LCEL, runnables, and chains | [20-Section-Introduction.ipynb](./course_content/tutorials/2-Chains/20-Section-Introduction.ipynb) |
| 03 | Prompting with messages | [30-Section-Introduction.ipynb](./course_content/tutorials/3-Prompting-With-Messages/30-Section-Introduction.ipynb) |
| 04 | Structured output | [40-Section-Introduction.ipynb](./course_content/tutorials/4-Structured-Output/40-Section-Introduction.ipynb) |
| 05 | Tools and agents | [50-Section-Introduction.ipynb](./course_content/tutorials/5-Tools/50-Section-Introduction.ipynb) |
| 06 | Workshop conclusion | [60-Conclusion.ipynb](./course_content/tutorials/6-Conclusion/60-Conclusion.ipynb) |

## Usage

The course can run on NVIDIA Brev, in Docker, or in a local Python
environment. A local GPU is not required because the notebooks call hosted
OpenAI-compatible NVIDIA model endpoints.

### API access

The interactive examples require an NVIDIA API key from
[build.nvidia.com](https://build.nvidia.com/explore/discover). The course does
not accept the key through the Dockerfile, Docker environment, command line, or
filesystem. Each API-backed notebook contains a normal setup cell that prompts
for the key and keeps it only in that notebook kernel's memory. Because
notebooks normally use separate kernels, expect to paste the key again when
starting another notebook.

The runtime defaults `NVIDIA_BASE_URL` to
`https://integrate.api.nvidia.com/v1`. You can override only this non-secret
base URL to use a compatible self-hosted endpoint.

### 1. Launch with NVIDIA Brev (recommended)

> **Brev launch link:** A course-specific one-click launch link will be added
> after this repository is published and its NVIDIA Brev Launchable has been
> tested.

The Brev Launchable will provide a preconfigured environment for the course:

1. Open the course's **Launch on Brev** link and sign in to NVIDIA Brev.
2. Keep the default CPU instance unless you specifically need another instance
   type. The course does not require a GPU.
3. Select **Deploy** and wait for the environment to finish starting.
4. Open JupyterLab and navigate to `course_content/tutorials`.
5. Begin with `Workshop-Intro.ipynb` and follow the modules in order.

The Launchable runs `course_content/environment/brev_setup.sh` to install the
pinned dependencies and connect the isolated course environment to Brev's
default Python kernel. Learners do not need to select a different kernel for
each notebook.

Do not provide your NVIDIA API key as a Brev launch parameter. Enter it only
when prompted by an API-backed notebook.

### 2. Run with Docker

Docker provides the most reproducible option for a workstation or an
on-premises system. From the repository root, run:

```bash
cd course_content
docker build -t oss-pe .
docker run --rm -it -p 8888:8888 oss-pe
```

Open <http://localhost:8888> and begin with `Workshop-Intro.ipynb`.

### 3. Run locally

Python 3.12 is recommended. From the repository root, create a virtual
environment and install the course dependencies.

On Linux or macOS:

```bash
cd course_content
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r environment/requirements.txt
jupyter lab tutorials
```

On Windows PowerShell:

```powershell
Set-Location course_content
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r environment/requirements.txt
jupyter lab tutorials
```

Open <http://localhost:8888> if JupyterLab does not open automatically.

### Use an on-premises endpoint

The notebooks can use a compatible self-hosted endpoint that provides the
models referenced by the course. Set `NVIDIA_BASE_URL` before starting
JupyterLab, or pass it to the Docker container. Do not put an API key in the
command.

For Docker:

```bash
docker run --rm -it -p 8888:8888 \
  -e NVIDIA_BASE_URL="https://your-endpoint.example.com/v1" \
  oss-pe
```

For a local Linux or macOS environment:

```bash
export NVIDIA_BASE_URL="https://your-endpoint.example.com/v1"
jupyter lab tutorials
```

For Windows PowerShell:

```powershell
$env:NVIDIA_BASE_URL = "https://your-endpoint.example.com/v1"
jupyter lab tutorials
```

`11-Nvidia-NIM.ipynb` explains how to generate an NVIDIA API key, and the first
key setup cell appears in `12-Hello-OpenAI.ipynb`.

## Repository layout

The repository is organized as follows:

- `course_content/Dockerfile` defines the shared CPU notebook runtime.
- `course_content/environment` contains dependencies and startup logic.
- `course_content/tutorials` contains the ordered notebook modules, helpers,
  and instructional images.
- `LICENSES`, `REUSE.toml`, and `THIRD_PARTY_NOTICES.md` contain licensing
  metadata.

## Validation

Run these lightweight checks from the repository root:

```bash
bash -n course_content/environment/entrypoint.sh
find course_content/tutorials -name '*.ipynb' -print0 | xargs -0 -n1 jq empty
git status --ignored --short
```

A complete functional test requires a valid API key and network access because
the notebooks intentionally call hosted models and, in one exercise, the
Open-Meteo API.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md). Keep notebook outputs cleared and
never commit API credentials or generated responses.

## License

This repository uses a mixed licensing model:

- Source-code files and code cells in Jupyter notebooks:
  [Apache License 2.0](LICENSES/Apache-2.0.txt)
- Documentation, Markdown and raw notebook cells, and NVIDIA-created
  educational media except proprietary assets identified in `REUSE.toml`:
  [Creative Commons Attribution 4.0 International](LICENSES/CC-BY-4.0.txt)
- Third-party material: its original license, as documented in
  [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)

Each complete Jupyter notebook is dual-licensed: code cells under Apache-2.0
and non-code cells under CC-BY-4.0. The combined dual-license terms are in
[LICENSES/CC-BY-4.0-Apache2_Dual_License.txt](LICENSES/CC-BY-4.0-Apache2_Dual_License.txt).

The NVIDIA images at
`course_content/tutorials/1-Intro-to-Prompting/images/build.nvidia.png` and
`course_content/tutorials/images/nvidia.png` are proprietary, are not licensed
under CC BY 4.0, and remain all rights reserved. See
[LICENSES/LicenseRef-NVIDIA-Proprietary.txt](LICENSES/LicenseRef-NVIDIA-Proprietary.txt).

NVIDIA names, logos, and trademarks are not licensed for general reuse.
