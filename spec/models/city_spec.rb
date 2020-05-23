require 'spec_helper'
require 'rails_helper'

describe City do

 before do 

      @fake_countries = [Country.create!(:country_name=>'Ireland'.upcase)]

      @fake_cities= [City.create!(:city_name => 'Galway', :mayor => 'Pat Larkin', 
                       :population => 75000, :isCostal => true, :country =>@fake_countries[0]),
                     City.create!(:city_name => 'Cork', :mayor => 'Paddy Smith', 
                       :population => 350000, :isCostal => true, :country =>@fake_countries[0])]
        end

  describe "#same country" do
    it "should find cities in the same country" do
    
        results = City.search_city(@fake_cities[0].country_id) 
         
        expect(results).to eq( @fake_cities)
   
    
        
        end

    end
end










# RSpec.describe City, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
