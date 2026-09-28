# Contributing

Please use the following guidelines when contributing to this project.

Before contributing significant changes, please open a GitHub issue to
discuss the proposed changes and avoid unnecessary or duplicated work.

## Licensing of contributions

- Code files must be contributed under
  [Apache-2.0](LICENSES/Apache-2.0.txt).
- Documentation must be contributed under
  [CC-BY-4.0](LICENSES/CC-BY-4.0.txt).
- Jupyter notebooks and other files containing both code and documentation
  must be contributed under Apache-2.0 AND CC-BY-4.0. Code cells are licensed
  under Apache-2.0, while Markdown and raw cells are licensed under CC-BY-4.0.
  The complete terms are provided in the
  [combined dual-license file](LICENSES/CC-BY-4.0-Apache2_Dual_License.txt).
- Every third-party image, dataset, quotation, or code sample must identify
  its creator, source URL, exact license, and any modifications.
- Material with unknown provenance will not be accepted.
- Existing copyright, attribution, and license notices must be preserved.
- Contributors must not add or change license terms without prior maintainer
  approval.

### License notices

New files must use the license specified for their file type and include a
machine-readable SPDX license identifier near the beginning of the file.

For source code licensed under Apache-2.0:

```python
# SPDX-License-Identifier: Apache-2.0
```

For standalone Markdown documentation licensed under CC-BY-4.0:

```markdown
<!-- SPDX-License-Identifier: CC-BY-4.0 -->
```

For a dual-licensed file:

```text
SPDX-License-Identifier: Apache-2.0 AND CC-BY-4.0
```

Use the appropriate comment syntax for the file type. The complete terms for
dual-licensed files are available in
[`LICENSES/CC-BY-4.0-Apache2_Dual_License.txt`](LICENSES/CC-BY-4.0-Apache2_Dual_License.txt).

For a Jupyter notebook, put the following notice in its first Markdown cell:

```markdown
<!-- SPDX-License-Identifier: Apache-2.0 AND CC-BY-4.0 -->

Code cells in this notebook are licensed under Apache-2.0. Markdown and raw
cells are licensed under CC-BY-4.0.
See the combined license terms in
`LICENSES/CC-BY-4.0-Apache2_Dual_License.txt`.
```

Adjust the path to the combined license file for the notebook's directory.

## Development guidelines

- Keep notebook outputs and execution counts cleared before committing.
- Never commit API keys, `.env` files, tokens, generated responses, or other
  credentials.
- Keep shared runtime dependencies in
  `course_content/environment/requirements.txt`.
- Preserve the instructional module order and place reusable helpers alongside
  the notebooks that consume them or under `course_content/tutorials/utils`.
- Record third-party material in `THIRD_PARTY_NOTICES.md` and `REUSE.toml`
  where applicable.

## Style and formatting

Some repositories use automated checks to keep contributed files consistent
and catch common problems before review. These checks may format code, verify
Markdown, detect syntax errors, identify trailing whitespace, or apply other
repository-specific rules. Some checks only report problems, while others
modify files automatically.

The rules enforced by these checks are defined in repository configuration
files. When present, files such as `.editorconfig`, `pyproject.toml`,
`.markdownlint-cli2.yaml`, and `.pre-commit-config.yaml` are the source of
truth for formatting, linting, and validation requirements.

If the repository does not provide automated checks, follow the conventions
used in the existing files and avoid reformatting unrelated code or
documentation.

### Jupyter notebook fallback

If the repository does not provide automated checks for Jupyter notebooks or
Markdown, use the following guidelines:

- Format directive names, language keywords, function or subroutine names,
  variable names, file names, commands, and command-line arguments as inline
  code using backticks.
- Begin fenced code blocks with three backticks followed by an appropriate
  language identifier, and end them with three backticks.
- Leave an empty line before and after each code block.
- Use a single pair of asterisks for emphasis and when introducing new terms.
  Use quotation marks or Markdown blockquotes for quotations.
- Place a level 1 heading at the top of the notebook as its title.

These fallback guidelines do not override rules configured in the repository.

### Running pre-commit

Install the project's development dependencies as described in its
`README.md`. If those dependencies do not include pre-commit, install it with:

```bash
python -m pip install pre-commit
```

Install the Git hook after cloning the repository:

```bash
pre-commit install
```

The Git hook checks the files staged for a commit. Most checks inspect the
complete contents of each staged file, not only the changed lines.

You can also run every configured check against every applicable file in the
repository before submitting a pull request:

```bash
pre-commit run --all-files
```

On its first run, pre-commit installs the environments required by the
configured checks. Unless the repository documentation says otherwise, the
individual formatting and linting tools do not need to be installed
separately.

If a check modifies files, review the changes, stage them, and run the checks
again. Contributions must pass all configured checks.

## Repository structure

Preserve the repository's existing structure and naming conventions. Follow
any repository-specific layout requirements documented in its `README.md` or
other project documentation.

Discuss significant structural changes, such as adding, moving, or renaming
top-level directories, with the maintainers before submitting them.

## Large binary files and Git LFS

Large presentations, videos, and other binary media are optional. When this
repository distributes them, enable only the applicable patterns in
`.gitattributes` and install Git Large File Storage (LFS) before adding or
updating those files:

```bash
git lfs install
```

Verify that a binary file is tracked by LFS before committing it:

```bash
git lfs ls-files
```

Add a binary pattern to `.gitattributes` only when the repository introduces
that media format. Do not enable unused patterns, and do not use LFS for normal
text, source-code, notebook, or Markdown files.

## Git workflow

Contributions follow GitHub's fork and pull request workflow. For detailed
instructions, see
[Contributing to a project](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project).

The five main steps for making a contribution are:

1. **Fork:** Create a fork of the repository in your personal GitHub account.
2. **Clone:** Clone your fork to your local machine.
3. **Create a feature branch:** Create a branch with a descriptive name for
   your changes.
4. **Commit and push:** Commit your changes and push the feature branch to
   your fork.
5. **Open a pull request:** Submit a pull request from your feature branch to
   the upstream repository. A maintainer will review the contribution and may
   request changes before deciding whether to merge it.

## Signing your work

We require all contributors to sign off their commits. By doing so, you
certify that the contribution is your original work or that you otherwise
have the right to submit it under the applicable license, as described in
the Developer Certificate of Origin below.

Contributions containing commits without a `Signed-off-by` line will not be
accepted.

To sign off a commit, use the `--signoff` or `-s` option:

```bash
git commit --signoff -m "Add cool feature"
```

This appends a line like the following to the commit message:

```text
Signed-off-by: Your Name <your.email@example.com>
```

The full text of the DCO follows:

```text
Developer Certificate of Origin
Version 1.1

Copyright (C) 2004, 2006 The Linux Foundation and its contributors.

Everyone is permitted to copy and distribute verbatim copies of this license
document, but changing it is not allowed.

Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I have the
    right to submit it under the open source license indicated in the file; or

(b) The contribution is based upon previous work that, to the best of my
    knowledge, is covered under an appropriate open source license and I have
    the right under that license to submit that work with modifications,
    whether created in whole or in part by me, under the same open source
    license (unless I am permitted to submit under a different license), as
    indicated in the file; or

(c) The contribution was provided directly to me by some other person who
    certified (a), (b) or (c) and I have not modified it.

(d) I understand and agree that this project and the contribution are public
    and that a record of the contribution (including all personal information
    I submit with it, including my sign-off) is maintained indefinitely and
    may be redistributed consistent with this project or the open source
    license(s) involved.
```
