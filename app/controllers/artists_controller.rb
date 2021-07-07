class ArtistsController < ApplicationController
  def index
    @artists = ['artist 1', 'artist 2']
  end

  def new
  end

  def create
    artist = Artist.new({
      name: params[:artist][:name],
      description: params[:artist][:description]
      })

      artist.save

      redirect_to '/artists'
    end
  end
