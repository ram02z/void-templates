#!/bin/bash

# NOTE: temporary fix
git config --global --add safe.directory '*'

tip=$(git rev-parse HEAD)
base=$(git rev-parse HEAD~)

/bin/echo -e '\x1b[32mRemoved packages:\x1b[0m'
git diff-tree -r --no-renames --name-only --diff-filter=D \
	"$base" "$tip" \
	-- "srcpkgs/*/template" |
	cut -d/ -f 2 |
	tee /tmp/removed |
	sed "s/^/  /" >&2

/bin/echo -e '\x1b[32mChanged packages:\x1b[0m'
git diff-tree -r --no-renames --name-only --diff-filter=AM \
	"$base" "$tip" \
	-- "srcpkgs/*/template" |
	cut -d/ -f 2 |
	tee /tmp/templates |
	sed "s/^/  /" >&2

PKGS=$(cat /tmp/templates)
for pkg in ${PKGS}; do
	mkdir -p "void-packages/srcpkgs/$pkg" && 
	cp -r "srcpkgs/$pkg/." "void-packages/srcpkgs/$pkg/"
done
