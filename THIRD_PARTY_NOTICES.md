# Third-Party Notices

This file identifies third-party software, services, and referenced material
used by the course. Third-party material is not relicensed by NVIDIA and
remains subject to its applicable license and service terms.

## Container base image and operating-system packages

The course container is built from the Docker Official Image
`python:3.12.1-slim`, which includes Python and Debian components under their
respective licenses. The Docker build also installs `build-essential`,
`ca-certificates`, `curl`, and `git` from Debian repositories. These components
are not vendored in this repository.

- Python license: <https://docs.python.org/3/license.html>
- Python Docker Official Image: <https://hub.docker.com/_/python>
- Debian copyright information: <https://www.debian.org/doc/debian-policy/ch-docs.html#copyright-information>

## Python dependencies

The container installs these packages from the Python Package Index. They are
not vendored and retain their own licenses.

| Package | Version | Declared license |
|---|---:|---|
| `jupyter` | 1.0.0 | BSD-3-Clause |
| `jupyterlab` | 4.6.1 | BSD-3-Clause |
| `tqdm` | 4.67.3 | MIT and MPL-2.0 |
| `langchain-nvidia-ai-endpoints` | 1.4.3 | MIT |
| `langchain` | 1.3.14 | MIT |
| `langchain-core` | 1.5.0 | MIT |
| `langchain-openai` | 1.4.0 | MIT |
| `langsmith` | 0.10.9 | MIT |
| `langgraph` | 1.2.9 | MIT |
| `Wikipedia-API` | 0.14.1 | MIT |
| `gradio` | 6.20.0 | Apache-2.0 |
| `grandalf` | 0.8 | EPL-1.0 |
| `contractions` | 0.1.73 | Apache-2.0 |
| `openai` | 2.46.0 | Apache-2.0 |
| `httpx` | 0.28.1 | BSD-3-Clause |
| `huggingface_hub` | 1.9.2 | Apache-2.0 |
| `requests` | 2.34.2 | Apache-2.0 |

Package metadata and license texts are available from each package's PyPI
project page and installed distribution.

## NVIDIA API Catalog and hosted models

The notebooks send prompts to OpenAI-compatible NVIDIA-hosted model endpoints
at `https://integrate.api.nvidia.com/v1`. The included examples reference the
following model identifiers:

- `nvidia/nemotron-nano-12b-v2-vl`
- `nvidia/nemotron-3-nano-omni-30b-a3b-reasoning`

No API key, model, model weight, training dataset, or fine-tuning dataset is
committed to this repository. Learners obtain their own credentials and are
responsible for the terms applicable to the service and selected model.

- NVIDIA API Catalog: <https://build.nvidia.com/explore/discover>
- NVIDIA Technology Access Terms: <https://developer.nvidia.com/legal/terms>

## Gradio Share service

The chatbot tutorial calls `launch(share=True)`, which creates a temporary,
publicly accessible `gradio.live` URL through the Gradio Share service. Anyone
with that URL may access the running application. Learners are instructed not
to submit confidential, personal, or proprietary information and to stop the
application when finished.

- Sharing Gradio applications: <https://www.gradio.app/guides/sharing-your-app>
- Understanding Gradio Share links: <https://www.gradio.app/guides/understanding-gradio-share-links>

## Open-Meteo Air Quality API

The agents tutorial can request live air-quality information from Open-Meteo.
Response data is not committed to this repository. Open-Meteo provides API
data under CC BY 4.0 and requires attribution; service limits and commercial
terms may also apply.

- Service: <https://open-meteo.com/en/docs/air-quality-api>
- License: <https://open-meteo.com/en/licence>
- Terms: <https://open-meteo.com/en/terms>

## Wikipedia

One exercise queries Wikipedia at runtime through the `Wikipedia-API` Python
package. Wikipedia content is not committed to this repository. Retrieved text
remains available under the licenses identified by Wikimedia, generally
CC BY-SA 4.0 and, where applicable, the GNU Free Documentation License.

- Wikimedia Terms of Use: <https://foundation.wikimedia.org/wiki/Policy:Terms_of_Use>
- Wikipedia copyright information: <https://en.wikipedia.org/wiki/Wikipedia:Copyrights>

## Referenced research

The chain-of-thought notebook cites the following paper but does not bundle the
paper or reproduce its figure:

- Jason Wei et al., "Chain-of-Thought Prompting Elicits Reasoning in Large
  Language Models," NeurIPS 2022: <https://arxiv.org/abs/2201.11903>

## NVIDIA proprietary media and branding

The repository includes these proprietary NVIDIA-created assets:

- `course_content/tutorials/1-Intro-to-Prompting/images/build.nvidia.png` —
  screenshot of the NVIDIA API Catalog interface.
- `course_content/tutorials/images/nvidia.png` — NVIDIA logo.

These files are not licensed under CC BY 4.0 or Apache-2.0 and remain all
rights reserved under `LICENSES/LicenseRef-NVIDIA-Proprietary.txt`.

NVIDIA names, logos, and trademarks are not licensed for general reuse.
