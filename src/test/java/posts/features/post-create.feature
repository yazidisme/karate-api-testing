Feature: As a client, I want to create a post

    Background:
      Given url urlBase + 'posts'
        * def requestBody = read('../requests/post.json')
        * def responseBody = read('../responses/post.json')

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
      And match response == '#(responseBody)'
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
      And match response == '#(responseBody)'
      And match response.userId == userId

