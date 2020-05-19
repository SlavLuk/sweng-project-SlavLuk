class City < ActiveRecord::Base
  belongs_to :country

  def self.search_city(country_id)

    City.joins(:country).where(:country_id=>country_id)
    
  
  end
end
