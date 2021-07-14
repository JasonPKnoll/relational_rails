require "rails"

RSpec.describe Artwork do
  it "can sort alphabetically" do
    Artwork.destroy_all
    povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    povichi = povi.artworks.create!(name: "Povichi",
                                    art_type: "3D Base Model",
                                    price: 32,
                                    for_sale: true)

    kemonomimi = povi.artworks.create!(name: "Kemonomimi",
                                      art_type: "3D Base Model",
                                      price: 45,
                                      for_sale: true)

    bees = povi.artworks.create!(name: "Bees",
                                    art_type: "2D digital art",
                                    price: 15,
                                    for_sale: true)
    expect(Artwork.sort_alphabetically).to eq([bees, kemonomimi, povichi])
  end
end
