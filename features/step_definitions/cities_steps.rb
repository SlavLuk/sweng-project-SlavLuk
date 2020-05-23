Given /the following cities exist/ do |cities_table|
  cities_table.hashes.each do |city|
    City.create city
  end
end

Given /the following countries exist/ do |countries_table|
  countries_table.hashes.each do |country|
    Country.create country
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
 
  expect(page.body.index(e1) < page.body.index(e2))

end

Then /^the mayor of "([^"]*)" should be "([^"]*)"$/ do |city_name,mayor|
    step %{I should see "#{mayor}"}
    step %{I should see "#{city_name}"}
end
