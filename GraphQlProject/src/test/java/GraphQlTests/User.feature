Feature: GraphQl Post request

  Background: 
    * url 'https://api.spacex.land/graphql/'

  #simple GraphQL request
  Scenario: Create a user
    Given def query = read('createUserQuery.graphql')    
    And request { query: '#(query)'}
    When method POST
    Then status 200
    And print 'response:', response
  
 
  #simple GraphQL request
  Scenario: Delete a user
    Given def query = read('deleteUserQuery.graphql')    
    And request { query: '#(query)'}
    When method POST
    Then status 200
    And print 'response:', response
  
 