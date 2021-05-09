#!/bin/bash

PKG="$1"

DESTDIR="$2"

SVDIR="${DESTDIR}"/etc/s6/sv

SRCDIRS=$(find "${PKG}" -mindepth 1 -type d)
SRCFILES=$(find "${PKG}" -mindepth 1 -type f)

for d in "${SRCDIRS}"; do
    install -v -d "${SVDIR}/${d#*/}"
done

for f in "${SRCFILES}"; do
    install -v -m644 "$f" "${SVDIR}/${f#*/}"
done
