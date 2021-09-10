@ignore @report=false
Feature: User reusable scenario

    Background:
        Given url urlBase + 'users'

    Scenario: Get random user id from existing data
        When method get
        Then status 200
          * def jsonPath = function(arg) { return karate.jsonPath(arg, '$[*].id') }
          * def result = call jsonPath response
          * def testData = Java.type('DataGenerator')
          * def id = testData.pickRandomInt(result)
