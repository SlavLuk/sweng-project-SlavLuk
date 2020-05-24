require 'rails_helper'


describe CitiesController, type: 'controller' do
    
   before do 
                       
      @fake_country = double(Country,:id=>1,  :country_name=>'Ireland'.upcase)

      @fake_cities= [double(City, :id=>1, :city_name => 'Galway', :mayor => 'Pat Larkin', 
                       :population => 75000, :isCostal => true, :country_id=>@fake_country.id),
                         double(City, :id=>2,  :city_name => 'Cork', :mayor => 'Paddy Smith', 
                       :population => 350000, :isCostal => true, :country_id=>@fake_country.id)]

      @fake_city_deleted = double(City, :id=>1, :city_name => 'Dublin', :mayor => 'Ryan Air', 
                       :population => 1500000, :isCostal => true, :country_id=>@fake_country.id)
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
  describe "#create a city and country" do

      it "should add a new city and country to database and redirect to the cities page" do
         
            original = City.count

            post :create ,{
                           :city=>{:id=>1, :city_name => 'Dublin', :mayor => 'Ryan Air', :population => 1500000, 
                           :isCostal => true },:country=>{:country_name=>"Ireland"}
                          }

            expect(original+1).to eq(City.count)

            expect(response).to redirect_to :cities

            expect(flash[:notice]).to eq("Dublin was successfully created.")
      end
      it "should throw an exeption if city name is empty " do
      
          post :create ,{
                           :city=>{:id=>1, :city_name => '', :mayor => 'Ryan Air', :population => 1500000, 
                           :isCostal => true },:country=>{:country_name=>"Ireland"}
                          }


          expect(response).to redirect_to :new_city

          expect(flash[:notice]).to eq("Sorry, Validation failed: City name can't be blank .")


      end
       it "should throw an exeption if country name is empty " do
      
          post :create ,{
                           :city=>{:id=>1, :city_name => 'Dublin', :mayor => 'Ryan Air', :population => 1500000, 
                           :isCostal => true },:country=>{:country_name=>""}
                          }


          expect(response).to redirect_to :new_city

          expect(flash[:notice]).to eq("Sorry,  country name can't be blank .")


      end
    end

    describe "#show" do

      it "should show the selected city details" do

         allow(City).to receive(:show).and_return(@fake_cities)
         expect(City).to receive(:find).and_return(@fake_cities[0])

        get :show, {:id => @fake_cities[0].id} 


      end
    end

    describe "#destroy " do
  
      it "should delete the selected city " do
       
        allow(City).to receive(:find).and_return(@fake_city_deleted)

        expect(@fake_city_deleted).to receive(:destroy)
           
        delete :destroy, {:id => @fake_city_deleted.id} 

        expect(flash[:notice]).to eq("City 'Dublin' was successfully deleted.")
        
        expect(response).to redirect_to :cities
      
      end
    end
end