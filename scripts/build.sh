#!/bin/sh
#
# build.sh


tip="$(git rev-list -1 --parents HEAD)"

base="$($tip | cut -d " " -f 2)"
tip="$($tip | cut -d " " -f 1)"

echo "$base $tip" >/tmp/revisions

/bin/echo -e '\x1b[32mChanged packages:\x1b[0m'
git diff-tree -r --no-renames --name-only --diff-filter=AM \
	"$tip" "$base" \
	-- 'srcpkgs/*/template' |
	cut -d/ -f 2 |
	tee /tmp/templates |
	sed "s/^/  /" >&2

PKGS=$(./void-packages/xbps-src sort-dependencies $(cat /tmp/templates))

for pkg in ${PKGS}; do
	./void-packages/xbps-src -j$(nproc) pkg "$pkg"
	[ $? -eq 1 ] && exit 1
done

exit 0
