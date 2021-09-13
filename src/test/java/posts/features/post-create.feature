Feature: As a client, I want to create a post

    Background:
      Given url urlBase + 'posts'
        * def requestBody = read('../requests/postTemplate.json')
        * def expectedResponseDataType = read('../responses/post.json')

    @parallel=false
    Scenario: Create a post
        * def userId = 12
        * def title = 'recommendation'
        * def body = 'motorcycle'
      When request requestBody
        * set requestBody.userId = userId
        * set requestBody.title = title
        * set requestBody.body = body
      And method post
      Then status 201
      And match response == '#(expectedResponseDataType)'
      And match response.userId == userId
      And match response.title == title
      And match response.body == body

    @CallReusableFeature
    Scenario: Create a post with dynamic user id
        * def userLists = call read('../../users/user-reusable.feature')
        * def userId = userLists.id
      When request requestBody
        * set requestBody.userId = userId
        * set requestBody.title = 'this is the title attribute'
        * set requestBody.body = 'this is the body attribute'
      And method post
      Then status 201
      And match response == '#(expectedResponseDataType)'
      And match response.userId == userId

    @DataFromReusable
    Scenario: Create a post with data from reusable feature
        * def userLists = call read('../../users/user-reusable.feature')
        * def userId = userLists.id
        * def anotherRequest =
        """
        {
          title: 'this is the title attribute',
          body: 'this is the body attribute',
          userId: #(userId)
        }
        """
      When request anotherRequest
      And method post
      Then status 201
      And match response == '#(expectedResponseDataType)'
      And match response.userId == userId

    @SimplyCucumberReport
    Scenario: Create a post with a separate request body using data from reusable feature
        * configure report = { showLog: true, showAllSteps: false }
        * configure logPrettyRequest = true
        * configure logPrettyResponse = true
        * def userLists = call read('../../users/user-reusable.feature')
        * def userId = userLists.id
        * def testData = Java.type('DataGenerator')
        * def title = testData.characters(5, 10, true, true)
        * def body = testData.sentence(30)
        * def requestData = read('../requests/postData.json')
      When request requestData
      And method post
      Then status 201
      And match response == '#(expectedResponseDataType)'
      And match response == read('../responses/postData.json')

    @Performance @ignore
    Scenario: Create a post with data from reusable feature
      * def userId = 1
      * def anotherRequest =
          """
          {
            title: 'title of performance testing',
            body: 'body of user simulation',
            userId: #(userId)
          }
          """
      When request anotherRequest
      And method post
      Then status 201
      And match response.userId == userId
