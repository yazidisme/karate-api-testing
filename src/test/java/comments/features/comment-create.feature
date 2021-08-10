Feature: As a client, I want to create comments

    Background:
        * configure logPrettyRequest = true
        * configure logPrettyResponse = true
        * def testData = Java.type('DataGenerator')
      Given url urlBase
  
    @DataTable
    Scenario: Create comments for any user
        * table comment
          | postId | title                                  | body                  |
          | 1      | testData.characters(3, 6, false, true) | testData.sentence(26) |
          | 3      | testData.characters(8, 9, true, false) | testData.sentence(59) |
        * def userLists = call read('../../users/user-reusable.feature')
      Given path 'users/' + userLists.id + '/comments'
      And request comment
      When method post
      Then status 201