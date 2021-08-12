Feature: As a client, I want to view todo lists

  Background:
    Given url urlBase
      * configure report = { showLog: true, showAllSteps: false }
      * configure logPrettyRequest = true
      * configure logPrettyResponse = true
      * def expectedResponse = read('../responses/todo.json')

  @BestPractice
  Scenario: Get todo lists
    Given path 'todos'
    And method get
    Then status 200
    And match response != '#[]? _.length == 0'
    And match response == '#[] expectedResponse'

  @BestPractice
  Scenario: Get todo lists from valid user
      * def userLists = call read('../../users/user-reusable.feature')
      * def expectedUserId = userLists.id
    Given path 'users', expectedUserId, 'todos'
    And method get
    Then status 200
    And match response == '#[] expectedResponse'
    And match each $[*].userId == expectedUserId
