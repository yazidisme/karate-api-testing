Feature: As a client, I want to update a comment
  
    Background: 
        Given url urlBase + 'comments'
          * def testData = Java.type('DataGenerator')

    @JavaFaker
    Scenario: Update a comment with test data providing by java faker
        When path 1
          * def postId = 1
          * def name = testData.name()
          * def email = testData.email()
          * def body = testData.sentence(20)
          * def requestBody = read('../requests/comment.json')
        And request requestBody
          * set requestBody.postId = postId
          * set requestBody.name = name
          * set requestBody.email = email
          * set requestBody.body = body
        And method put
        Then status 200
          * def responseBody = read('../responses/comment.json')
        And match response == '#(responseBody)'
        And match response.postId == postId
        And match response.name == name
        And match response.email == email
        And match response.body == body

    @report=false
    Scenario: Update a comment without postId and hide from the report
        When method put
        Then status 404
        And match response == {}
  