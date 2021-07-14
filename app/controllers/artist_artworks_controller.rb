class ArtistArtworksController < ApplicationController
  def index
    if params.has_key?(:sorting)
      @artist = Artist.find(params[:artist_id])
      @artworks = @artist.artworks.sort_alphabetically
    elsif params.has_key?(:above_price)
      @artist = Artist.find(params[:artist_id])
      @artworks = @artist.artworks.where("price >= ?", params[:above_price])
    else
      @artist = Artist.find(params[:artist_id])
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

  def update
    @artist.artworks.create(artwork_params)

    redirect_to "/artworks/#{@artist.id}/artworks"
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
