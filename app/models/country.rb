class Country < ActiveRecord::Base
    
    has_many :cities, :dependent => :destroy

    def country_name=(value)
      write_attribute(:country_name, value.upcase)
    end


end
