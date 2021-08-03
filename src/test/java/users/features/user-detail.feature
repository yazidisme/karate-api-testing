Feature: As a client, I want to view user details

   Background:
      Given url urlBase + 'users'

   Scenario: Get user details
      * def geo = read('../json/geo.json')
      * def address = read('../json/address.json')
      * def company = read('../json/company.json')
      * def user = read('../json/user.json')
      Given path 1
      When method get
      Then status 200
      And match response == '#(user)'
