class ArtistArtworksController < ApplicationController
  def index
    artist = Artist.find(params[:id])
    @artworks = artist.artworks
  end
end
