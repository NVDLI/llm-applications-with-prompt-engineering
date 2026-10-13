# Building LLM Applications With Prompt Engineering

Building LLM Applications With Prompt Engineering is an open-source,
hands-on [NVIDIA Deep Learning Institute](https://www.nvidia.com/en-us/training?ncid=ref-dli-557888)
workshop. Learners use the
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
| --- | --- | --- |
| 00 | Workshop introduction | [Workshop-Intro.ipynb](./course_content/tutorials/Workshop-Intro.ipynb) |
| 01 | Introduction to prompting | [10-Section-Introduction.ipynb](./course_content/tutorials/1-Intro-to-Prompting/10-Section-Introduction.ipynb) |
| 02 | LCEL, runnables, and chains | [20-Section-Introduction.ipynb](./course_content/tutorials/2-Chains/20-Section-Introduction.ipynb) |
| 03 | Prompting with messages | [30-Section-Introduction.ipynb](./course_content/tutorials/3-Prompting-With-Messages/30-Section-Introduction.ipynb) |
| 04 | Structured output | [40-Section-Introduction.ipynb](./course_content/tutorials/4-Structured-Output/40-Section-Introduction.ipynb) |
| 05 | Tools and agents | [50-Section-Introduction.ipynb](./course_content/tutorials/5-Tools/50-Section-Introduction.ipynb) |
| 06 | Workshop conclusion | [60-Conclusion.ipynb](./course_content/tutorials/6-Conclusion/60-Conclusion.ipynb) |

The companion [course slide deck](./course_content/slides/slides-v1.pptx) is
included with the course materials.

## Usage

The course can run on NVIDIA Brev, in Docker, or in a local Python
environment. A local GPU is not required because the notebooks call hosted
OpenAI-compatible NVIDIA model endpoints.

### API access

The default course path uses an NVIDIA API key from
[build.nvidia.com](https://build.nvidia.com/explore/discover). The notebooks do
not require a local GPU, so learners can use an eligible CPU-only NVIDIA Brev
instance where free capacity is available. Access is subject to the applicable
service terms, quotas, rate limits, regional availability, and model
availability. NVIDIA provides free hosted API endpoints for prototyping;
responses may occasionally be slow or the service temporarily unavailable.
See Sections 2 and 7 of the
[NVIDIA Technology Access Terms of Use](https://developer.nvidia.com/legal/terms).

The course does not accept an API key through the Dockerfile, Docker
environment, command line, or filesystem. Each API-backed notebook contains a
normal setup cell that prompts for the key and keeps it only in that notebook
kernel's memory. Because notebooks normally use separate kernels, expect to
paste the key again when starting another notebook.

The runtime defaults `NVIDIA_BASE_URL` to
`https://integrate.api.nvidia.com/v1`. The notebooks can also use another
OpenAI-compatible endpoint that provides the required models.

### Use another OpenAI-compatible API endpoint

You can adapt the notebooks to a hosted or self-hosted OpenAI-compatible chat
completion endpoint. Review its access requirements, service terms, data
handling, quotas, and any charges before using it. Switching endpoints is a
manual configuration choice; the course does not switch automatically.

In **each API-backed notebook** you want to run against another endpoint:

1. Set `os.environ["NVIDIA_BASE_URL"]` to the endpoint's documented API base
   URL before the cell that reads `base_url`. Include the API version path
   where required (often `/v1`), rather than a website URL or the full
   `/chat/completions` request URL.
2. Change the `model` value, or the `model=` argument in a direct API call, to
   the exact model identifier accepted by that endpoint. Identifiers can
   differ in spelling and capitalization even for the same model. The course
   uses Nemotron 3.5 Lightning and Nemotron 3 Super; choose the corresponding
   models if available, or alternatives with the capabilities needed by each
   exercise. Different models can produce different results.
3. Enter credentials for the selected endpoint in the notebook's API-key
   prompt. The existing code stores the key in `NVIDIA_API_KEY` for the course
   client, even when the endpoint is elsewhere. If a key is already present
   in the kernel, restart the kernel and rerun the setup cells to replace it.
   Never put a key in notebook source or commit it to the repository.
4. Rerun the client-creation cells after changing the configuration. Existing
   `client` and `llm` objects retain their earlier settings. Configuration in
   one notebook is not automatically shared with another notebook's kernel.

OpenAI compatibility does not guarantee that every exercise works unchanged.
Check the following when adapting or troubleshooting a notebook:

- **Client compatibility:** The notebooks use the `OpenAI` SDK and LangChain's
  `ChatNVIDIA` integration. An endpoint may require a different LangChain
  integration, authentication mechanism, or headers; changing the URL alone
  may not be sufficient. A different integration may also require additional
  dependencies.
- **Request parameters:** Check supported token-limit parameters, temperature
  ranges, and reasoning controls. In particular, the course's
  `chat_template_kwargs` and `enable_thinking` settings are not universal.
  Review parameters passed through `extra_body` or `model_kwargs` if requests
  are rejected.
- **Exercise capabilities:** Confirm streaming, structured output, tool
  calling, and tool-choice controls are supported where used. A successful
  basic chat request does not establish support for these features. Context
  and output-token limits can also differ.
- **Access and connectivity:** Authentication or permission errors can mean
  the key lacks access to the selected model. Not-found errors can indicate
  an incorrect base URL or model identifier. Rate-limit errors, timeouts, and
  service errors require checking the endpoint's limits and availability.
  The endpoint must be reachable from the machine running the notebook;
  `localhost` on Brev refers to the Brev instance, not your own computer.

Begin with a short chat request, then test the features required by the
notebook before running the complete exercise. Consult the endpoint's API
documentation for its supported behavior and error meanings.

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

Environment setup will be configured in the Brev Launchable, rather than a
startup script in this repository. Before publishing the launch link, the
Launchable will be tested to ensure the course dependencies are available in
the notebook kernel.

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
