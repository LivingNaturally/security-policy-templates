#!/bin/bash
rm -fr ./site/* ./docs/* ./partials/*
psp build -t ./templates -c genius-central-config.json
mkdocs build
mkdir -p site/docx
pandoc -s -o site/docx/policies.docx $(find docs -name "*.md")
