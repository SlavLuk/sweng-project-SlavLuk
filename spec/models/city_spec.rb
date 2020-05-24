require 'spec_helper'
require 'rails_helper'

describe City , type: 'model' do

  before do 

      @fake_countries = [Country.create!(:country_name=>'Ireland'.upcase),
                         Country.create!(:country_name=>'England'.upcase) ]

      @fake_same_count= [City.create!(:city_name => 'Galway', :mayor => 'Pat Larkin', 
                       :population => 75000, :isCostal => true, :country =>@fake_countries[0]),
                         City.create!(:city_name => 'Cork', :mayor => 'Paddy Smith', 
                       :population => 350000, :isCostal => true, :country =>@fake_countries[0])]

      @fake_not_same_count = [ City.create!(:city_name => 'London', :mayor => 'Boris', 
                       :population => 10000000, :isCostal => false, :country =>@fake_countries[1])]
        end

  describe "#same country" do

    it "should find cities in the same country" do
    
        results = City.search_city(@fake_same_count[0].country_id) 
         
        expect(results).to eq( @fake_same_count)

    end

    it "should not find cities belonging to different countries" do
    
        results = City.search_city(@fake_same_count[0].country_id) 
         
        expect(results).not_to eq(@fake_not_same_count)

          end
    end
end