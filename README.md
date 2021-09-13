# Karate for API Testing

## Requirement
* Java Development Kit
* Maven

## Running Tests
* Clone the repository from your fork to this directory
* Open the project using any text editor or Java IDE
* Run the tests with the script below
```shell
$ mvn clean test
```

## Test Report
* Test report automatically generated on `target` folder after finished the test execution
* See test report from `target/karate-reports/karate-summary.html` for the Karate default report
* Also, See the test result that used cucumber report from `target/cucumber-html-reports/overview-features.html` on your browser

## Performance Tests
* Run the user simulation with the script below
```shell
$ mvn clean test-compile gatling:test
```
* See test report in the `target/gatling/usersimulation/`, then open `index.html` file
