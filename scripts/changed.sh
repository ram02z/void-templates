#!/bin/bash

tip="$(git rev-list -1 --parents HEAD)"
case "$tip" in
	*" "*" "*) tip="${tip##* }" ;;
	*)         tip="${tip%% *}" ;;
esac

base="$(git merge-base FETCH_HEAD "$tip")"

/bin/echo -e '\x1b[32mChanged packages:\x1b[0m'
git diff-tree -r --no-renames --name-only --diff-filter=AM \
	"$base" "$tip" \
	-- "srcpkgs/*/template" |
	cut -d/ -f 2 |
	tee /tmp/templates |
	sed "s/^/  /" >&2
