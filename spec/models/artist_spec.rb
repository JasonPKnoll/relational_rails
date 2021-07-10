require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :artworks}

  describe 'instance methods' do
    before :each do
      @povi = Artist.create!(name: "Povi",
                            description: "From scratch avatar creator",
                            years_experience: 10,
                            comissions_open: false)

      @artwork = @povi.artworks.create!(name: "Povichi",
                                      art_type: "3D Base Model",
                                      price: 32,
                                      for_sale: true)

      @artwork_2 = @povi.artworks.create!(name: "Kemonomimi",
                                        art_type: "3D Base Model",
                                        price: 45,
                                        for_sale: true)

    end

    it '#total_number_of_artworks' do
      expect(@povi.total_number_of_artworks).to eq(2)
    end

  end
end
