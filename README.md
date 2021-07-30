# Karate for API Testing

## Requirement
* Java Development Kit
* Maven

## Running Tests
* Clone the repository from your fork to this directory
* Open the project using any text editor or Java IDE
* Run the tests with the script below
```shell
$ mvn clean test -Dtest=TestRunner
```

## Test Report
* Test report automatically generated on `target` folder after finished the test execution
* See test report from `target/cucumber-reports/advanced-reports/cucumber-html-reports/overview-features.html`
* Or, see from `target/surefire-reports/karate-summary.html` for the Karate default report
