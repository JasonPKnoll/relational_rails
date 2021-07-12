class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    beer = Beer.find(params[:id])
    beer.update(beer_params)
    beer.save
    redirect_to "/beers/#{beer.id}"
  end

  def beer_params
    params.permit(:name, :style, :abv, :ibu, :non_alcoholic)
  end

end
