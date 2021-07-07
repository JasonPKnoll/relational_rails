class BreweriesController < ApplicationController
  def index
    @breweries = ['Brewery 1', 'Brewery 2']
  end

  def new
  end

  def create
    require 'pry'; binding.pry
    brewery = Brewery.new({
      name: params[:brewery][:name],
      year: params[:brewery][:year]
      })
    require 'pry'; binding.pry
    brewery.save
    require 'pry'; binding.pry
    redirect_to "/breweries"
  end
end
