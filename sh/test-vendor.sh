#!/bin/bash
set -e

if [[ ! -d /application/vendor/phpunit ]]; then
    composer require --dev phpunit/phpunit
fi

/application/vendor/bin/phpunit