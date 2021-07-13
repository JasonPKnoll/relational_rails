class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all.order('breweries.created_at DESC')
  end

  def new
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def create
    brewery = Brewery.create(brewery_params)
    brewery.save
    redirect_to "/breweries"
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    brewery = Brewery.find(params[:id])
    brewery.update(brewery_params)
    brewery.save
    redirect_to "/breweries/#{brewery.id}"
  end
  #
  # def destroy
  #   Brewery.destroy(params[:id])
  #   redirect_to "/breweries"
  # end

  def brewery_params
    params.permit(:name, :location, :year_established, :multiple_brewhouses)
  end
end
