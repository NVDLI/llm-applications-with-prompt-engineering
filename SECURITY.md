# Security Policy

This repository contains course materials and a local JupyterLab runtime. It
does not operate a hosted service or intentionally store user data.

## Reporting a vulnerability

Report suspected vulnerabilities privately through the repository's
confidential security-reporting mechanism or to the maintainers listed in
`CODEOWNERS`. Do not disclose the issue publicly until it has been reviewed.

## API credentials

The notebooks call an external NVIDIA API endpoint. API-backed notebooks use an
interactive setup cell and retain the key only in the current kernel's memory.
The typed value is visible while entering it, so avoid screen sharing or
recording during entry. Never put a real key in notebook source, Docker
configuration, environment files, command-line arguments, generated output,
transcripts, or issue reports. Shut down the notebook kernel to discard its
in-memory key, and revoke any key that may have been exposed.

## Scope

- The Docker image and Python dependency chain
- Notebook content, links, and executable code
- External API calls and credential handling
- Repository configuration
