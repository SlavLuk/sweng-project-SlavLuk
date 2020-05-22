Feature: display list of countries sorted in ascending order
 
  As a curious tourist
  So that I can quickly see the names of the cities from same country
  I want to see cities sorted by countries

Background: cities have been added to database
  
  Given the following cities exist:

  | city_name | mayor       | population | isCostal | country |
  | London    | Boris Johns | 7500000    |  false   | England |
  | Liverpool |             | 3000000    |  true    | England |
  | Galway    | Pat Larkin  | 75000      |  true    | Ireland |
  | Cork      | John Smith  | 350000     |  true    | Ireland |
  | Tampa     |             | 100000     |  true    | USA     |
  | New York  | Leo Govanni | 1000000    |  true    | USA     |
  | Luanda    |             | 2500000    |  true    | Angola  |

  And I am on the City Info home page

Scenario: sort countries alphabetically
  When I follow "Country"
  Then I should see "Angola" before "England"


