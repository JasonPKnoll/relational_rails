class ArtistArtworksController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    if params.has_key?(:sorting)
      @artworks = @artist.artworks.sort_alphabetically
    elsif params.has_key?(:above_price)
      @artworks = @artist.artworks.search_by_price(params[:above_price])
    else
      @artworks = @artist.artworks
    end
  end

  def new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    artwork = @artist.artworks.create(artwork_params)
    artwork.save
    redirect_to "/artists/#{@artist.id}/artworks"
  end

  private
  def artwork_params
    params.permit(:name, :art_type, :price, :for_sale)
  end
end
