class BreweryBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:brewery_id])
  end

  def new
    @brewery = Brewery.find(params[:brewery_id])
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    beer = @brewery.beers.create(beer_params)
    beer.save
    redirect_to "/breweries/#{@brewery.id}/beers"
  end

  def beer_params
    params.permit(:name, :style, :abv, :ibu, :non_alcoholic)
  end
end
