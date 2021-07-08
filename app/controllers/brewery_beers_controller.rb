class BreweryBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:brewery_id])
  end
end
