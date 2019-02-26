# Docker image to run phpUnit tests


```bash
docker run --env TEST_RUNNER_FRAMEWORK=S4 -v /path/to/your/application:/application phpvigo/php-test-runner:7.1
```
## Environment vars

### TEST_RUNNER_FRAMEWORK

Your framework or application. Accepted values:

* **S4**: Symfony4 (default value)
* **S3**: Symfony3
* **S2**: Symfony2
* **lavarel**: Laravel5
* **vendor**: Other applications that have phpunit as composer require dev.
* **global**: Your test are writing extending a global installation of PHP Unit


### TEST_RUNNER_COVERAGE

Output the code coverage information. Accepted values:
 
* **true**
* **false** (default value)

### TEST_RUNNER_COVERAGE_HTML

Export the test stats in HTML. Accepted values:
 
* **true**
* **false** (default value)

The output folder is the test folder into the public path. The public path is detected automatically by the 
TEST_RUNNER_FRAMEWORK value. You can "force" a specific folder with the env var **TEST_RUNNER_COVERAGE_HTML_PATH**

## Using .env.test

You can set all environment vars into a .env.test file:

```.dotenv
TEST_RUNNER_FRAMEWORK=S4
TEST_RUNNER_COVERAGE=true
TEST_RUNNER_COVERAGE_HTML=true
```

## Examples

```bash
docker run --env TEST_RUNNER_FRAMEWORK=S4 -v /path/to/your/application:/application phpvigo/php-test-runner:7.1
```

```bash
docker run --env TEST_RUNNER_FRAMEWORK=S4 --env TEST_RUNNER_COVERAGE_HTML -v /path/to/your/application:/application phpvigo/php-test-runner:7.1
```

```bash
docker run --env-file ./env.test -v /path/to/your/application:/application phpvigo/php-test-runner:7.1
```