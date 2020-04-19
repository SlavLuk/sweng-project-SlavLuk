class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :index, :edit, :update, :destroy]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.joins(:country)
    
    # @cities = City.joins(:country).select('cities.city_name, countries.country_name')
 

  end

  # GET /cities/1
  # GET /cities/1.json
  def show
     @city = City.find(params[:id])
  end

  # GET /cities/new
  def new
  
    # @city = City.new
  
  end


  # POST /cities
  # POST /cities.json
  def create

    @country = Country.create!(country_params)
  
    
    @city = City.create!(:city_name => city_params[:city_name], :mayor => city_params[:mayor], 
            :population => city_params[:population], :isCostal => city_params[:isCostal], :country =>@country)

    flash[:notice] = "#{@city.city_name} was successfully created."

    redirect_to cities_path
  
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
  
    @city = City.find params[:id]
    @city.update_attributes!(city_params)
    @country =Country.find(@city.country_id)
    @country.update_attributes(country_params)
    flash[:notice] = "#{@country.country_name} was successfully updated."
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
