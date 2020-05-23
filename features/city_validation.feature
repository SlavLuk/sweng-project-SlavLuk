Feature: add a new city

   As a tourist
   So that I can add a new city to my collection
   I want to add a new city I visited on my latest trip

Scenario: add a new city and country
   Given I am on the City Info home page
   When I follow "Add new City"
   Then I should be on the Create New City page
   And I fill in "City" with "Dublin"
   And I fill in "Population" with "1000000"
   And I fill in "Country" with "IRELAND"
   And I press "Save"
   Then I should see "Dublin"

Scenario: can't add a new city if we leave text field blank (sad path)
  Given I am on the City Info home page
  When I follow "Add new City"
  Then I should be on the Create New City page
  And I fill in "City" with " "
  And I fill in "Country" with "IRELAND"
  And I press "Save"
  Then I should be on the Create New City page
  And I should see "Sorry, Validation failed: City name can't be blank"

