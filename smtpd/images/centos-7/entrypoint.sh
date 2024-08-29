#!/bin/sh
set -e

/opt/halon/bin/halonctl license fetch --username ${HALON_REPO_USER} --password ${HALON_REPO_PASS} --path /license.key

exec env LD_LIBRARY_PATH=/opt/halon/lib/:$LD_LIBRARY_PATH "$@"
