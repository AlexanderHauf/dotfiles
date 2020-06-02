#!/bin/sh

# input the iso
# The skript then checks the checksum of
# (uncomment the right version)

# a Kubuntu 20.04 iso:
sha_orig="ffddf52ad0122180a130f1d738a9a2cb77d87848a326a16cf830ac871a3c786f"

# a Ubuntu 20.04 desktop iso:
# sha_orig="e5b72e9cfe20988991c9cd87bde43c0b691e3b67b01f76d23f8150615883ce11"

[ "$sha_orig" = "$(sha256sum $1)" ] && echo success || echo error
