

 country_1 = Country.create!(:country_name=>'Ireland'.upcase)
 country_2 = Country.create!(:country_name=>'USA')
 country_3 = Country.create!(:country_name=>'England')

city = City.create!(:city_name => 'Galway', :mayor => 'Peter Larkin', 
            :population => 75000, :isCostal => true, :country =>country_1)
city_1 = City.create!(:city_name => 'Tampa', :mayor => '', 
            :population => 100000, :isCostal => true, :country =>country_2)
city_2 = City.create!(:city_name => 'London', :mayor => 'Boris Johns', 
            :population => 7500000, :isCostal => false, :country =>country_3)
city_3 = City.create!(:city_name => 'Cork', :mayor => 'John Smith', 
            :population => 350000, :isCostal => true, :country =>country_1)
city_4 = City.create!(:city_name => 'New York', :mayor => 'Govanni Perry', 
            :population => 1000000, :isCostal => true, :country =>country_2)
city_5 = City.create!(:city_name => 'Liverpool', :mayor => '', 
            :population => 3000000, :isCostal => true, :country =>country_3)

        


