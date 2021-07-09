require 'rails_helper'

RSpec.describe 'the artists show page' do

  # => Story 2
  # => As a visitor
  # => When I visit '/artists/:id'
  # => Then I see the artist with that id including the artists attributes
  it 'displays the artists specified by id and all its attributes' do
    artist = Artist.create!(name: "Povi", description: "From scratch avatar creator", years_experience: 10, comissions_open: false)
    artist_2 = Artist.create!(name: "lincoln", description: "3D artist", years_experience: 1, comissions_open: false)
    visit "/artists/#{artist.id}" #localhost:3000/artist/1

    expect(page).to have_content(artist.name)
    expect(page).to_not have_content(artist_2.name)
  end
end
