Feature: As a client, I want to create a post

    Background:
      Given url urlBase + 'posts'
      * configure report = { showLog: true, showAllSteps: false }

    @parallel=false
    Scenario: Create a post
        * def userId = 12
        * def title = 'recommendation'
        * def body = 'motorcycle'
        * def requestBody = read('../requests/post.json')
      When request requestBody
        * set requestBody.userId = 12
        * set requestBody.title = title
        * set requestBody.body = body
      And method post
      Then status 201
        * def responseBody = read('../responses/post.json')
      And match response == '#(responseBody)'
      And match response.userId == userId
      And match response.title == title
      And match response.body == body

