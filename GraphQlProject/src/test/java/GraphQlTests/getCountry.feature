Feature: GraphQl Get request

  Background: 
    * url 'https://countries.trevorblades.com/'

  #simple GraphQL request
  Scenario: fetch continent details
    Given text query =
      """
      query continents{
      continents{
      code
      name 
      }
      }
      """
    And request { query: '#(query)' }
    When method POST
    Then status 200
    And print 'response:', response
    Then match $ == "#object"

  #simple GraphQL request
  Scenario: fetch language details
    Given text query =
      """
      query continents{
      languages{
      code
      name 
      native
      rtl
      }
      }
      """
    And request { query: '#(query)' }
    When method POST
    Then status 200
    And print 'response:', response
    Then match $ == "#object"

  #simple GraphQL request
  Scenario: fetch country details
    Given text query =
      """
       query continents{
       countries{
       code
       name 
       native
       }
       }
      """
    And request { query: '#(query)' }
    When method POST
    Then status 200
    And print 'response:', response
    Then match $ == "#object"

  #simple GraphQL request
  Scenario: fetch country for variable
    Given def query = read('getCountryQuery.graphql')
    And def variables = {"name": "AD"}
    And request { query: '#(query)' ,variables: '#(variables)'}
    When method post
    * print 'response:', response
    Then status 200

  #simple GraphQL request
  Scenario: fetch continent for variable language and countries
    Given text query =
      """
       query continents{
      continents{
      code
      name
      countries{
      code
      name
      languages{
        code 
        name
        native
      }
      }
      
      }
      }
      """
    And request { query: '#(query)' }
    When method POST
    Then status 200
    And print 'response:', response
    Then match $ == "#object"
