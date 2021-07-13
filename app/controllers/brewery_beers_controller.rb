class BreweryBeersController < ApplicationController
  def index
    if params.has_key?(:sort)
      @brewery = Brewery.find(params[:brewery_id])
      @beers = @brewery.beers.sort_beers_by_name
    elsif params.has_key?(:search_ibus)
      @brewery = Brewery.find(params[:brewery_id])
      @beers = @brewery.beers.where("ibu > ?", params[:search_ibus])
    else
      @brewery = Brewery.find(params[:brewery_id])
      @beers = @brewery.beers
    end
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
