#!/bin/bash

/bin/echo -e '\x1b[32mChanged packages:\x1b[0m'
git diff-tree -r --no-renames --name-only --diff-filter=AM \
	$(git rev-list -1 --parents HEAD) \
	-- "srcpkgs/*/template" |
	cut -d/ -f 2 |
	tee /tmp/templates |
	sed "s/^/  /" >&2


PKGS=$(cat /tmp/templates)
for pkg in ${PKGS}; do
	mkdir -p "void-packages/srcpkgs/$pkg" && 
	cp "srcpkgs/$pkg/template" "void-packages/srcpkgs/$pkg/template"
done
