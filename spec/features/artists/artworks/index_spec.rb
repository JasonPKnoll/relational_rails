require 'rails_helper'

RSpec.describe 'Artists songs index' do

  # => Story 5
  # => As a visitor
  # => When I visit '/artists/artist_id/artwork'
  # => I then see artwork that is associated with that artist with all artworks attributes
  it 'displays specified artwork of that artist based on their id' do
    povi = Artist.create!(name: "Povi", description: "From scratch avatar creator", years_experience: 10, comissions_open: false)
    povichi = povi.artworks.create!(name: "Povichi", art_type: "3D Base Model", price: 32, for_sale: true)
    kemononmimi = povi.artworks.create!(name: "Kemonomimi", art_type: "3D Base Model", price: 45, for_sale: true)
    visit "/artists/#{povi.id}/artworks"

    expect(page).to have_content(povichi.name)
    expect(page).to have_content(kemononmimi.name)
  end


end
