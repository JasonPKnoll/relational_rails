class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all
  end

  def new
  end

  def create
    brewery = Brewery.new({
      name: params[:brewery][:name],
      year_established: params[:brewery][:year_established],
      in_colorado: params[:brewery][:in_colorado]
      })
    brewery.save
    redirect_to "/breweries"
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    brewery = Brewery.find(params[:id])
    brewery.update({
      name: params[:brewery][:name],
      year_established: params[:brewery][:year_established],
      in_colorado: params[:brewery][:in_colorado]
      })
    brewery.save
    redirect_to "/breweries/#{brewery.id}"
  end

  def destroy
    Brewery.destroy(params[:id])
    redirect_to "/breweries"
  end

end
