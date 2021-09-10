Feature: As a client, I want to view comment details

    Background:
        Given url urlBase + 'comments'
            * configure report = { showLog: true, showAllSteps: false }
            * def expectedResponse = read('../responses/comment.json')

    @ConfigureReportLogSteps
    Scenario: Get comment details
        When path 3
        And method get
        Then status 200
        And match response == '#(expectedResponse)'

    @ConditionalLogic
    # if (condition) call true
    Scenario: Run scenario get comment details when success get comment list
        Given method get
        When if (responseStatus == 200) karate.call('comment-detail.feature@ConfigureReportLogSteps')

    @ConditionalLogic
    # variable = condition ? call true : call false
    Scenario: Get comment detail data when success to get comment id and failed to get comment id
        Given method get
        And def commentLists = response.id != '#null' ? karate.call('../comment-reusable.feature@RandomCommentId') : { id: 0 }
        And def commentId = commentLists.id
        When path commentId
        And method get
        And def result = responseStatus == 200 ? '#(expectedResponse)' : {}
        Then match response == result
