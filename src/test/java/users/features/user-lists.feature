Feature: As a client, I want to view user lists

    Background:
        Given url urlBase + 'users'

    @CommonAssertions
    Scenario: Get user lists with common assertions
        When method get
        Then status 200
        And match each response[*].id == '#number'
        And match each response[*].name == '#string'
        And match each response[*].username == '#string'
        And match each response[*].email == '#string'
        And match each response[*].email == '#string'
        And match each response[*].address.street == '#string'
        And match each response[*].address.suite == '#string'
        And match each response[*].address.city == '#string'
        And match each response[*].address.zipcode == '#string'
        And match each response[*].address.geo.lat == '#string'
        And match each response[*].address.geo.long == '#string'
        And match each response[*].phone == '#string'
        And match each response[*].website == '#string'
        And match each response[*].website contains '.'
        And match each response[*].company.name == '#string'
        And match each response[*].company.catchPhrase == '#string'
        And match each response[*].company.bs == '#string'

    @JsonAssertions
    Scenario: Get user lists with JSON schema assertions
            * def geo = { lat: '#string', lng: '#string' }
            * def address = { street: '#string', suite: '#string', city: '#string', zipcode: '#string', geo: '#(geo)'}
            * def company = { name: '#string', catchPhrase: '#string', bs: '#string' }
            * def user =
                """
                {
                    id: '#number',
                    name: '#string',
                    username: '#string',
                    email: '#string',
                    address: '#(address)',
                    phone: '#string',
                    website: '#string',
                    company: '#(company)'
                }
                """
        When method get
        Then status 200
        And match response == '#[] user'

    @FileAssertions
    Scenario: Get user lists with separate JSON files for assertions
            * def geo = read('../responses/geo.json')
            * def address = read('../responses/address.json')
            * def company = read('../responses/company.json')
            * def user = read('../responses/user.json')
        When method get
        Then status 200
        And match response == '#[] user'
