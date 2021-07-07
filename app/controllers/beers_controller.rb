class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
  end

end
