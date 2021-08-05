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
