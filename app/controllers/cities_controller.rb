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

  # GET /cities/1/edit
  def edit
     @city = City.find(params[:id])
  end

  # POST /cities
  # POST /cities.json
  def create
    # @country = Country.create!('Russia')
    
    @city = City.create!(city_params)
    flash[:notice] = "#{@city.city_name} was successfully created."
    # redirect_to movies_path
  
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
  
    @city = City.find params[:id]
    @city.update_attributes!(city_params)
    flash[:notice] = "#{@city.city_name} was successfully updated."
    redirect_to cities_path(@city)
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
   
    @city = City.find params[:id]
    @city.destroy
    flash[:notice] = "City '#{@city.city_name} ' deleted."
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
end
