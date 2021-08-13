Feature: GraphQl Post request

  Background: 
    * url 'https://api.spacex.land/graphql/'

  #simple GraphQL request
  Scenario: Create a country 
    Given def query = read('createCountryQuery.graphql')    
    And request { query: '#(query)'}
    When method POST
    Then status 200
    And print 'response:', response
  
 