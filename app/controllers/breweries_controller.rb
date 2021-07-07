class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all
  end

  def new
  end

  def create
    brewery = Brewery.new({
      name: params[:brewery][:name],
      year_established: params[:brewery][:year_established]
      })
    brewery.save
    redirect_to '/breweries'
  end

end
