#!/bin/bash

tip=$(git rev-parse HEAD)
base=$(git rev-parse HEAD~)

/bin/echo -e '\x1b[32mChanged packages:\x1b[0m'
git diff-tree -r --no-renames --name-only --diff-filter=AM \
	"$base:srcpkgs" "$tip:srcpkgs" |
	cut -d/ -f 1 |
	tee /tmp/templates |
	sed "s/^/  /" >&2


PKGS=$(cat /tmp/templates)
for pkg in ${PKGS}; do
	mkdir -p "void-packages/srcpkgs/$pkg" && 
	cp "srcpkgs/$pkg/template" "void-packages/srcpkgs/$pkg/template"
done
