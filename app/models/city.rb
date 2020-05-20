class City < ActiveRecord::Base
  belongs_to :country

  validates :city_name, presence: true 
  validates :population, length: { minimum: 1 }
 

  def self.search_city(country_id)

    City.joins(:country).where(:country_id=>country_id)
    
  
  end
end
