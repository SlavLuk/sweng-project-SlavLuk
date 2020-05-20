class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :index, :edit, :update, :destroy]

  def find_country

      @city = City.find(params[:id])
     
      @cities = City.search_city(@city.country_id)
 
  end

  # GET /cities
  def index

     sort = params[:sort]
     
     if sort == 'country_name'  # Retreives cities and join countries order by country name
     
       @cities = City.joins(:country).merge(Country.order(country_name: :asc))

     else

        @cities = City.joins(:country)

     end
           
  end

  # GET /cities/1
  def show
     @city = City.find(params[:id])
  end

  # GET /cities/new
  def new
  
    # @city = City.new
  
  end


  # POST /cities
  def create

    begin

    # Raise exception if country name are nil, blank
    if country_params[:country_name].blank?
        raise StandardError.new " country name can't be blank"
    end

    # Checks if country exists in database if it does use it
    @country = Country.find_by country_name: country_params[:country_name].upcase

    if  @country == nil # if there is no country in database create a new one

        @country = Country.create!(country_params)
    end
      
    @city = City.create!(:city_name => city_params[:city_name], :mayor => city_params[:mayor], 
            :population => city_params[:population], :isCostal => city_params[:isCostal], :country =>@country)

    flash[:notice] = "#{@city.city_name} was successfully created."

    redirect_to cities_path

    rescue Exception =>e
    
     flash[:notice] = "Sorry, #{e.message} ."
    
     redirect_to new_city_path

    end
  
  end

  # PATCH/PUT /cities/1
  def update
  
    @city = City.find params[:id]
  
    @city.update_attributes!(city_params)
  
    flash[:notice] = "#{@city.city_name} was successfully updated."

    redirect_to cities_path(@city)
  end

  
  # GET /cities/1/edit
  def edit
     @city = City.find(params[:id])
     @country =Country.find(@city.country_id)

  end

  # DELETE /cities/1
  def destroy
   
    @city = City.find params[:id]
    @city.destroy
    flash[:notice] = "City '#{@city.city_name} ' was successfully deleted."
    redirect_to cities_path(@city)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
     # @city = City.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:city_name, :mayor, :population, :isCostal, :country_id)
    end

     def country_params
      params.require(:country).permit(:country_name)
    end

end
