#!/bin/sh

PKG="$1"

DESTDIR="$2"

SVDIR="${DESTDIR}"/etc/s6/sv
CONFDIR="${DESTDIR}"/etc/s6/config

for dir in "$PKG"/*; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        for subdir in "$dir"/*; do
            if [ -d "$subdir" ]; then
                subdirname=$(basename "$subdir")
                install -v -d "${SVDIR}"/"$dirname"/"$subdirname"
                for file in "$subdir"/*; do
                    install -v -m644 "$file" "${SVDIR}"/"$dirname"/"$subdirname"
                done
            fi
        done
        install -v -d "${SVDIR}"/"$dirname"
        for file in "$dir"/*; do
            install -v -m644 "$file" "${SVDIR}"/"$dirname"
        done
    fi
done

if [ -e "$PKG"/*.conf ]; then
    for conf in "$PKG"/*.conf; do
        install -v -d "${CONFDIR}"
        install -v -m644 "$conf" "${CONFDIR}"/"$PKG".conf
    done
fi
