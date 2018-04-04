#!/bin/bash

set -- "${1:-$(</dev/stdin)}" "${@:2}"

cd /var/www/my-command/
php bin/console app:my-command "$@"
