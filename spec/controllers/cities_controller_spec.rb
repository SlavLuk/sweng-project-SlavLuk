require 'rails_helper'


describe CitiesController, type: 'controller' do
    
   before do 
                       
      @fake_countries = [double(Country,:id=>1,  :country_name=>'Ireland'.upcase),
                         double(Country, :id=>2, :country_name=>'England'.upcase)]

      @fake_cities= [double(City, :id=>1, :city_name => 'Galway', :mayor => 'Pat Larkin', 
                       :population => 75000, :isCostal => true, :country_id=>@fake_countries[0].id),
                         double(City, :id=>2,  :city_name => 'Cork', :mayor => 'Paddy Smith', 
                       :population => 350000, :isCostal => true, :country_id=>@fake_countries[0].id)]

      @fake_city = [double(City, :id=>3, :city_name => 'London', :mayor => 'Boris', 
                       :population => 10000000, :isCostal => false, :country_id=>@fake_countries[1].id)]
        end
    
  describe "#same country" do

    context "When many cities belong to one country" do

      it "should find cities in same country" do

                  
             allow(City).to receive(:search_city).and_return(@fake_cities)
             expect(City).to receive(:find).and_return(@fake_cities[0])

             get :find_country, {:id => @fake_cities[0].id} 
                
            end 
           end
        end
    end