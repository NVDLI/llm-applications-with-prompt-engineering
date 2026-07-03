# Contributing

We welcome contributions to this project. Documentation and educational
content use CC BY 4.0, while source code uses Apache 2.0.

## Signing your work

Contributors must certify their work using the Developer Certificate of Origin
(DCO) 1.1. Sign each commit with:

~~~bash
git commit --signoff -m "Describe the change"
~~~

The complete DCO text is available at <https://developercertificate.org/>.

## Development guidelines

- Keep notebook outputs and execution counts cleared before committing.
- Never commit API keys, `.env` files, tokens, generated responses, or other
  credentials.
- Keep shared runtime dependencies in
  `course_content/environment/requirements.txt`.
- Preserve the instructional module order and place reusable helpers alongside
  the notebooks that consume them or under `course_content/tutorials/utils`.
- Document the creator, source URL, exact license, and modifications for every
  third-party image, dataset, quotation, or code sample.

## Licensing of contributions

- Code files and notebook code cells must be contributed under Apache 2.0.
- Documentation and notebook non-code cells must be contributed under
  CC BY 4.0.
- Third-party material retains its original license and must be recorded in
  `THIRD_PARTY_NOTICES.md` and `REUSE.toml` where applicable.

