Feature: search for cities by country

  As a tourist
  So that I can find cities in a country
  I want to include and search on country information in cities I enter

Background: cities in database

  Given the following cities exist:
  
  | city_name | mayor       | population | isCostal | 
  | London    | Boris Johns | 7500000    |  false   | 
  | Liverpool |             | 3000000    |  true    | 
  | Galway    | Pat Larkin  | 75000      |  true    | 
  | Cork      | John Smith  | 350000     |  true    | 
  | Tampa     |             | 100000     |  true    | 
  | New York  | Leo Govanni | 1000000    |  true    | 
  

Scenario: add mayor to existing city
  When I go to the edit page for "Liverpool"
  And  I fill in "Mayor" with "Jürgen Klopp"
  And  I press "Update City Info"
  Then the mayor of "Liverpool" should be "Jürgen Klopp"



  Given the following cities exist:
  
  | city_name | mayor       | population | isCostal | country |
  | London    | Boris Johns | 7500000    |  false   | ENGLAND |
  | Liverpool |             | 3000000    |  true    | ENGLAND |
  | Galway    | Pat Larkin  | 75000      |  true    | IRELAND |
  | Cork      | John Smith  | 350000     |  true    | IRELAND |
  | Tampa     |             | 100000     |  true    | USA     |
  | New York  | Leo Govanni | 1000000    |  true    | USA     |

Scenario: find cities in same country
  Given I am on the details page for "Galway"
  When  I follow "Find Cities In Same Country"
  Then  I should be on the Listing Cities in Same Country for  "Galway"
  And   I should see "Cork"
  But   I should not see "Liverpool"

