#!/bin/bash
set -e

if [[ ! -d /application/vendor/phpunit ]]; then
    composer require --dev phpunit/phpunit
fi

if [[ -z "${TEST_RUNNER_COVERAGE_HTML_PATH}" ]]; then
  TEST_RUNNER_COVERAGE_HTML_PATH="/application/public/tests"
fi

COVERAGE=""

if [[ $TEST_RUNNER_COVERAGE == true ]]; then
    COVERAGE=" --coverage-text"
fi

if [[ $TEST_RUNNER_COVERAGE_HTML == true ]]; then
    COVERAGE+=" --coverage-html ${TEST_RUNNER_COVERAGE_HTML_PATH}"
fi

/application/vendor/bin/phpunit --configuration /application/phpunit.xml $COVERAGE