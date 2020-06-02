#!/bin/sh

sha_orig='ffddf52ad0122180a130f1d738a9a2cb77d87848a326a16cf830ac871a3c786f'

sha_file=$(sha256sum $1)


[ "$sha_orig" = "$sha_file" ] && echo success || echo error
