#!/bin/bash
rm -fr ./site/* ./docs/* ./partials/*
psp build -t ./templates -c genius-central-config.json
mkdocs build
mkdir -p site/docx
pandoc -s -o site/docx/policies.docx $(cat mkdocs.yml | yq -r '.pages[] | to_entries[] | "docs/\(.value)"')
