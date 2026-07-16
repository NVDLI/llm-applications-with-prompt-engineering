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

## API access

The interactive examples require an NVIDIA API key from
[build.nvidia.com](https://build.nvidia.com/explore/discover). The course does
not accept the key through the Dockerfile, Docker environment, command line, or
filesystem. Each API-backed notebook contains a normal setup cell that prompts
for the key and keeps it only in that notebook kernel's memory. Because
notebooks normally use separate kernels, expect to paste the key again when
starting another notebook.

The runtime defaults `NVIDIA_BASE_URL` to
`https://integrate.api.nvidia.com/v1`; override only the non-secret base URL to
use a compatible self-hosted endpoint.

## Run with Docker

~~~bash
cd course_content
docker build -t oss-pe .
docker run --rm -it -p 8888:8888 oss-pe
~~~

Open <http://localhost:8888> and begin with `Workshop-Intro.ipynb`.
`11-Nvidia-NIM.ipynb` explains how to generate a key, and the first key setup
cell appears in `12-Hello-OpenAI.ipynb`.

To use a compatible self-hosted endpoint:

~~~bash
docker run --rm -it \
  -p 8888:8888 \
  -e NVIDIA_BASE_URL="http://host.docker.internal:8000/v1" \
  oss-pe
~~~

## Run locally

Python 3.12 is recommended.

~~~bash
cd course_content
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r environment/requirements.txt
jupyter lab tutorials
~~~

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

~~~bash
bash -n course_content/environment/entrypoint.sh
find course_content/tutorials -name '*.ipynb' -print0 | xargs -0 -n1 jq empty
git status --ignored --short
~~~

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
  educational media:
  [Creative Commons Attribution 4.0 International](LICENSES/CC-BY-4.0.txt)
- Third-party material: its original license, as documented in
  [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)

Each complete Jupyter notebook is dual-licensed: code cells under Apache-2.0
and non-code cells under CC-BY-4.0. The combined dual-license terms are in
[LICENSES/CC-BY-4.0-Apache2_Dual_License.txt](LICENSES/CC-BY-4.0-Apache2_Dual_License.txt).

NVIDIA names, logos, and trademarks are not licensed for general reuse.
