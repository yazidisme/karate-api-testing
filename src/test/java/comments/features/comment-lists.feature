Feature: As a client, I want to view comment lists

    Background:
        Given url urlBase + 'comments'

    @ConfigReportFalse
    Scenario: Get comment lists and hide step that starts with * symbol
            * configure report = false
            * def expectedResponse = read('../responses/comment.json')
        When method get
        Then status 200
        And match response == '#[] expectedResponse'
