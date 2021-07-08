class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
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

    def show
      @artist = Artist.find(params[:id])
    end

    def update
      artist = Artist.find(params[:id])
      artist.update({
        name: params[:artist][:name],
        description: params[:artist][:description]
        })
        artist.save
        redirect_to "/artists/#{artist.id}"
    end

    def destroy
      Artist.destroy(params[:id])
      redirect_to '/artists'
    end
  end
