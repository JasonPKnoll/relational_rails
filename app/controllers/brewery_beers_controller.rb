class BreweryBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:brewery_id])
    if params.has_key?(:sort)
      @beers = @brewery.beers.sort_beers_by_name
    elsif params.has_key?(:search)
      @beers = @brewery.beers.search_by_ibus(params[:search])
    else
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

  private
  def beer_params
    params.permit(:name, :style, :abv, :ibu, :non_alcoholic)
  end
end
