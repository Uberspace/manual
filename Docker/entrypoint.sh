#!/bin/sh
if [ $# -eq 0 ]; then
	find 'source' -type f -name '*.rst' -print0 \
		| xargs --null --no-run-if-empty write-good
else
	write-good "$@"
fi
