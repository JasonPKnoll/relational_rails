class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(created_at: :desc)
  end

  def new
  end

  def create
    artist = Artist.new({
      name: params[:artist][:name],
      description: params[:artist][:description],
      years_experience: params[:artist][:years_experience],
      comissions_open: params[:artist][:comissions_open]
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
        description: params[:artist][:description],
        years_experience: params[:artist][:years_experience],
        comissions_open: params[:artist][:comissions_open]
        })
        artist.save
        redirect_to "/artists/#{artist.id}"
    end

    def destroy
      Artist.destroy(params[:id])
      redirect_to '/artists'
    end
  end
