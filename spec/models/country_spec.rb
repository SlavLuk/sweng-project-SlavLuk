require 'spec_helper'
require 'rails_helper'


describe Country , type: 'model' do

  before do 

      @fake_country = Country.create!(:country_name=>'Ireland')

        end

  describe "#uppercase " do

    it "should convert to upper case" do
         
        expect(@fake_country.country_name).to eq("IRELAND")

     end
   end
end