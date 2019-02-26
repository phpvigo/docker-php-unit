#!/bin/bash
set -e

if [[ ! -d /application/vendor/symfony/phpunit-bridge ]]; then
    composer require --dev symfony/phpunit-bridge
fi

/application/bin/simple-phpunit -c app/