#!/bin/bash
set -e

if [[ ! -d /application/vendor/symfony/phpunit-bridge ]]; then
    composer require --dev symfony/phpunit-bridge
fi

if [[ -z "${TEST_RUNNER_COVERAGE_HTML_PATH}" ]]; then
  TEST_RUNNER_COVERAGE_HTML_PATH="/application/web/tests"
fi

COVERAGE=""

if [[ $TEST_RUNNER_COVERAGE == true ]]; then
    COVERAGE=" --coverage-text"
fi

if [[ $TEST_RUNNER_COVERAGE_HTML == true ]]; then
    COVERAGE+=" --coverage-html ${TEST_RUNNER_COVERAGE_HTML_PATH}"
fi

/application/bin/simple-phpunit -c app/ $COVERAGE