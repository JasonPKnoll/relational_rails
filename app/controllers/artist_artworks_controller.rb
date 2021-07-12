class ArtistArtworksController < ApplicationController
  def index
    @artist = Artist.find(params[:id])
    @artworks = @artist.artworks
  end

  def new
  end

  def create
    @artist = Artist.find(params[:id])
    artwork = @artist.artworks.create(artwork_params)
    artwork.save
    redirect_to "/artists/#{artist.id}"
  end

  def update
    @artist.artworks.create(artwork_params)

    redirect_to "/artworks/#{artwork.id}"
  end

  def destroy
    Artwork.destroy(params[:id])
    redirect_to '/artworks'
  end

  private
  def artwork_params
    params.permit(:name, :art_type, :price, :for_sale)
  end
end
