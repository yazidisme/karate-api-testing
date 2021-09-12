Feature: As a client, I want to update a post

  Background:
    Given url urlBase + 'posts'
      * def userLists = callonce read('../../users/user-reusable.feature')
      * def userId = userLists.id
      * def postLists = callonce read('../post-reusable.feature@GetRandomPostId')
      * def jsonBody =
        """
        {
          title: 'title attribute is updated',
          body: 'body attribute is updated',
          userId: #(userId),
          id: #(postId)
        }
        """
      * configure afterScenario = function() { karate.call('../post-reusable.feature@DeletePost') }

    @Hooks
    Scenario: Update a post using id from callonce variable in the background
        * def postId = postLists.id
      Given path postId
      And request jsonBody
        * set jsonBody.id = postId
      When method put
      Then status 200
      And match response == jsonBody

    @Hooks
    Scenario Outline: Delete a post on every scenario after post updated
      Given path <postId>
      And request jsonBody
      And set jsonBody.id = <postId>
      When method put
      Then status 200
      And match response == jsonBody
      Examples:
        | postId |
        | 2      |
        | 4      |
