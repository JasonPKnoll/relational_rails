class BreweriesController < ApplicationController
  def index
    @breweries = ['Brewery 1', 'Brewery 2']
  end
end
