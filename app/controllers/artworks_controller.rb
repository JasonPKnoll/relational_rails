class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all.where(for_sale: true)
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    artwork.save
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
