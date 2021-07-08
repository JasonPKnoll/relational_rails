class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  # def new
  # end

  # def create
  #   brewery = Brewery.new({
  #     name: params[:brewery][:name],
  #     location: params[:brewery][:location],
  #     year_established: params[:brewery][:year_established]
  #     })
  #   brewery.save
  #   redirect_to "/breweries"
  # end
  #

  # def edit
  #   @brewery = Brewery.find(params[:id])
  # end
  #
  # def update
  #   brewery = Brewery.find(params[:id])
  #   brewery.update({
  #     name: params[:brewery][:name],
  #     location: params[:brewery][:location],
  #     year_established: params[:brewery][:year_established]
  #     })
  #   brewery.save
  #   redirect_to "/breweries/#{brewery.id}"
  # end
  #
  # def destroy
  #   Brewery.destroy(params[:id])
  #   redirect_to "/breweries"
  # end

end
