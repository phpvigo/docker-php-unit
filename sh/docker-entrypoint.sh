#!/bin/bash
set -e

if [[ "$TEST_RUNNER_FRAMEWORK" = 'S4' ]]; then
    test-symfony4.sh
fi

if [[ "$TEST_RUNNER_FRAMEWORK" = 'S2' ]]; then
    test-symfony2.sh
fi

if [[ "$TEST_RUNNER_FRAMEWORK" = 'vendor' ]]; then
    test-vendor.sh
fi

if [[ "$TEST_RUNNER_FRAMEWORK" = 'laravel' ]]; then
    test-laravel.sh
fi

exec "$@"