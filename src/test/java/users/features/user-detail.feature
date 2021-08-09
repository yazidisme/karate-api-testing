Feature: As a client, I want to view user details

   Background:
      Given url urlBase + 'users'

   @ScenarioOutline
   Scenario Outline: Get user details
         * def geo = read('../responses/geo.json')
         * def address = read('../responses/address.json')
         * def company = read('../responses/company.json')
         * def user = read('../responses/user.json')
      When path <userid>
      And method get
      Then status 200
      And match response == '#(user)'
     Examples:
        | userid |
        | 1      |
        | 3      |

   @DataValidations
   Scenario: Get user details with data type validations
      When path 2
      And method get
      Then status 200
      And match response.email == '#regex[a-zA-Z]+@+[a-zA-Z]+.+'
      And match response.address.geo.lat == '#? _ >= -90 && _ <= 90'
      And match response.address.geo.lng == '#? _ >= -180 && _ <= 180'