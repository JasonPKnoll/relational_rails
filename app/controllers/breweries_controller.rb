class BreweriesController < ApplicationController
  def index
    @breweries = ['Brewery 1', 'Brewery 2', 'Brewery 3']
  end

  def new
  end
end
