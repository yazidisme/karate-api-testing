@ignore @report=false
Feature: Comment reusable scenario

  Background:
    Given url urlBase

  @RandomCommentId
  Scenario: Get random comment id from existing data
    Given path 'comments'
    When method get
    Then status 200
      * def jsonPath = function(arg) { return karate.jsonPath(arg, '$[*].id') }
      * def result = call jsonPath response
      * def testData = Java.type('DataGenerator')
      * def id = testData.pickRandomInt(result)

  @CreateComment
  Scenario: Create comments for any user
    * table comment
      | postId | title                                  | body                  |
      | 1      | testData.characters(3, 6, false, true) | testData.sentence(26) |
    Given path 'users/' + 1 + '/comments'
    And request comment
    When method post
    Then status 201
