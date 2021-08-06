Feature: As a client, I want to view comment details

    Background:
        Given url urlBase + 'comments'
            * configure report = { showLog: true, showAllSteps: false }

    @ConfigureReportLogSteps
    Scenario: Get comment details
        When path 3
        And method get
            * def expectedResponse = read('../responses/comment.json')
        Then status 200
        And match response == '#(expectedResponse)'