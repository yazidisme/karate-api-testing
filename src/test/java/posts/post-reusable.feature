@ignore @report=false
Feature: Post reusable scenario

  Background:
    Given url urlBase + 'posts'
      * def testData = Java.type('DataGenerator')

  @CreatePost
  Scenario: Create a post
      * def userLists = call read('../../users/user-reusable.feature')
      * table requestData
        | userId       | body                  | title                                  |
        | userLists.id | testData.sentence(30) | testData.characters(5, 10, true, true) |
    When request requestData
    And method post
    Then status 201
      * def id = response.id

  @GetPostIdLists
  Scenario: Get post id lists
    When method get
    Then status 200
      * def jsonPath = function(arg) { return karate.jsonPath(arg, '$[*].id') }
      * def result = call jsonPath response

  @GetRandomPostId
  Scenario: Get random post id from another reusable scenario
    When def postIdLists = call read('../post-reusable.feature@GetPostIdLists')
    Then def id = testData.pickRandomInt(postIdLists.result)
    
  @DeletePost
  Scenario: Delete post using id
    Given path postId
    When method delete
    Then status 200
