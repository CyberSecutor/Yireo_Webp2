#!/usr/bin/env bash

set -e
trap '>&2 echo Error: Command \`$BASH_COMMAND\` on line $LINENO failed with exit code $?' ERR

if [[ ${TEST_SUITE} == "integration" ]]; then
    source .travis/scripts/mock-mail.sh
fi

# disable xdebug and adjust memory limit
if [[ ${TEST_SUITE} != "unit" ]]; then
  echo > ~/.phpenv/versions/$(phpenv version-name)/etc/conf.d/xdebug.ini
fi

echo 'memory_limit = -1' >> ~/.phpenv/versions/$(phpenv version-name)/etc/conf.d/travis.ini

phpenv rehash;
