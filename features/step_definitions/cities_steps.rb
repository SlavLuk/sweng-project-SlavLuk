Given /the following cities exist/ do |cities_table|
  cities_table.hashes.each do |city|
    City.create city
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Then /I should see all the cities/ do
 
  City.all.each do |city|
    step %{I should see "#{city.city_name}"}
    
  end
end


Then /^the mayor of "([^"]*)" should be "([^"]*)"$/ do |city_name,mayor|
    step %{I should see "#{mayor}"}
    step %{I should see "#{city_name}"}
end
