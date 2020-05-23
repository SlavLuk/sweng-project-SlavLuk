Feature: display list of countries sorted in ascending order
 
  As a curious tourist
  So that I can quickly see the names of the cities from same country
  I want to see countries sorted in ascending order

Background: countries have been added to database

  Given the following countries exist:

  | country_name |
  | ENGLAND      |
  | IRELAND      |
  | USA          |
  


  And I am on the City Info home page
 @load-seed-data @US49
Scenario: sort countries alphabetically
  When I follow "Country"
  Then I should see "ENGLAND" before "IRELAND"


