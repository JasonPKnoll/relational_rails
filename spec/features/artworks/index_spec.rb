require 'rails_helper'

RSpec.describe 'the artworks index page' do

  # => Story 3
  # => As a visitor
  # => When I visit '/artworks/'
  # => Then I see each artwork in the system including the artworks attributes:
  it 'displays the artworks name' do
    povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    artwork = povi.artworks.create!(name: "Povichi",
                                    art_type: "3D Base Model",
                                    price: 32,
                                    for_sale: true)

    visit "/artworks" #localhost:3000/artwork

    expect(page).to have_content(artwork.name)
    expect(page).to have_content(artwork.art_type)
    expect(page).to have_content(artwork.price)
    expect(page).to have_content(artwork.for_sale)
    expect(page).to have_content(artwork.created_at)
    expect(page).to have_content(artwork.updated_at)
  end

  it 'displays artworks index link on all pages' do

    # => Story 8
    # => As a visitor
    # => When I visit any page
    # => I see a link at the top of the page that takes me to artworks index
    visit "/" # welcome page
    expect(page).to have_link("Artworks Index")

    visit "/artworks"
    expect(page).to have_link("Artworks Index")

    visit "/artists"
    expect(page).to have_link("Artworks Index")

    visit "/easteregg"
    expect(page).to have_link("Artworks Index")
  end

  it 'only shows records where for sale is true' do
    # User Story 15, Artwork Index only shows `true` Records (x2)
    # As a visitor
    # When I visit the artworks index
    # Then I only see records where the boolean column is `true`

    povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    artwork = povi.artworks.create!(name: "Povichi V2",
                                    art_type: "3D Base Model",
                                    price: 35,
                                    for_sale: true)

    artwork_2 = povi.artworks.create!(name: "Kemonomimi V2",
                                      art_type: "3D Base Model",
                                      price: 50,
                                      for_sale: false)

    visit "/artworks/"

    expect(page).to_not have_content("Kemonomimi V2")
  end

  it 'can update artworks from artworks index page' do

    # User Story 18, Artwork Update From Artworks Index Page (x1)
    # As a visitor
    # When I visit the `artworks` index page or a Artist `artworks` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `artworks` edit page where I can update its information just like in User Story 11

    povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    artwork = povi.artworks.create!(name: "Povichi V2",
                                    art_type: "3D Base Model",
                                    price: 35,
                                    for_sale: true)

    artwork_2 = povi.artworks.create!(name: "Kemonomimi V2",
                                      art_type: "3D Base Model",
                                      price: 50,
                                      for_sale: false)

    visit '/artworks/'

    click_link 'Edit Povichi V2'

    fill_in "name", with: "Povichi V2.1"

    click_button "Update Artwork"

    expect(current_path).to eq("/artworks/#{artwork.id}")
    expect(page).to have_content("Povichi V2.1")
  end
end
