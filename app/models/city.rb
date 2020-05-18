class City < ActiveRecord::Base
  belongs_to :country

  def self.search_city(country_name)

    City.joins(:country).where(:country_id=>country_name)
    
  
  end
end
