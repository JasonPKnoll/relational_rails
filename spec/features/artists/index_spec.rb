require 'rails_helper'

RSpec.describe 'the artists index page' do

  # => Story 1
  # => As a visitor
  # => When I visit '/artists'
  # => I see the name of each artist record in the system
  it 'displays all artists names' do
    artist = Artist.create!(name: "Povi", description: "From scratch avatar creator", years_experience: 10, comissions_open: false)
    visit "/artists" #localhost:3000/artist

    expect(page).to have_content(artist.name)
  end

  # => Story 6
  # => As a visitor
  # => When I visit '/artists'
  # => I see the name of each artist by most recently created
  it 'displays all artists by most recently created' do
    povi = Artist.create!(name: "Povi", description: "From scratch avatar creator", years_experience: 10, comissions_open: false)
    megan = Artist.create!(name: "Megan", description: "3D artists", years_experience: 2, comissions_open: true)
    srgrafo = Artist.create!(name: "SrGrafo", description: "digital artists", years_experience: 5, comissions_open: false)
    visit "/artists"

    expect(page).to have_content(povi.name)
    expect(page).to have_content(megan.name)
    expect(page).to have_content(srgrafo.name)

    expect("Megan").to appear_before("Povi")
    expect("SrGrafo").to appear_before("Megan")
  end
end
