class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def new
  end

  def create
    artwork = Artwork.new({
      name: params[:artwork][:name],
      art_type: params[:artwork][:art_type]
      })

      artwork.save

      redirect_to '/artworks'
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update({
      name: params[:artwork][:name],
      art_type: params[:artwork][:art_type]
      })
      artwork.save
      redirect_to "/artworks/#{artwork.id}"
  end

  def destroy
    Artwork.destroy(params[:id])
    redirect_to '/artworks'
  end
end
