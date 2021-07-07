class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def new
  end

  def create
    artwork = Artwork.new({
      title: params[:artwork][:title],
      description: params[:artwork][:description]
      })

      artwork.save

      redirect_to '/artworks'
  end
end
