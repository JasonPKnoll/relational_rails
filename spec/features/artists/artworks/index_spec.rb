require 'rails_helper'

RSpec.describe 'Artist artworks index' do
  before :each do
    @povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    @povichi = @povi.artworks.create!(name: "Povichi",
                                    art_type: "3D Base Model",
                                    price: 32,
                                    for_sale: true)

    @kemononmimi = @povi.artworks.create!(name: "Kemonomimi",
                                        art_type: "3D Base Model",
                                        price: 45,
                                        for_sale: true)

    @abc = @povi.artworks.create!(name: "ABC",
                                        art_type: "3D Base Model",
                                        price: 10,
                                        for_sale: true)
  end

  it 'displays specified artwork of that artist based on their id' do

    # => Story 5
    # => As a visitor
    # => When I visit '/artists/artist_id/artwork'
    # => I then see artwork that is associated with that artist with all artworks attributes
    visit "/artists/#{@povi.id}/artworks"

    expect(page).to have_content(@povichi.name)
    expect(page).to have_content(@kemononmimi.name)
  end

  it 'displays artists index link on all pages' do

    # => Story 10
    # => As a visitor
    # => When I visit artists show page (artists/:id)
    # => I see link at the top that takes me to ('/artists/:id/artworks')
    visit "/artists/#{@povi.id}"

    expect(page).to have_selector(:link, href: "/artists/#{@povi.id}/artworks")
  end

  # Story 13
  # As a visitor
  # When I visit a Artists Artworks Index page
  # Then I see a link to add a new adoptable artwork for that parent "Create Artwork"
  # When I click the link
  # I am taken to '/artists/:id/artworks/new' where I see a form to add a new adoptable artwork
  # When I fill in the form with the artwork's attributes:
  # And I click the button "Create Artwork"
  # Then a `POST` request is sent to '/artists/:id/artworks',
  # a new artwork object/row is created for that parent,
  # and I am redirected to the Artists Artworks Index page where I can see the new artwork listed
  it 'can link to new artwork from artists/:id index' do
    visit "artists/#{@povi.id}/artworks"
    click_link "Create Artwork"

    expect(current_path).to eq("/artists/#{@povi.id}/artworks/new")
    expect(page).to have_content("Name")
    expect(page).to have_content("Art Type")
    expect(page).to have_content("Price")
    expect(page).to have_content("For Sale?")
  end

  it 'can create new artwork' do
    visit "artists/#{@povi.id}/artworks/new"
    fill_in "name", with: "Povichi V2"
    click_button "Create Artwork"

    expect(current_path).to eq("/artists/#{@povi.id}/artworks")
    expect(page).to have_content("Povichi V2")
  end

  it 'has all artist artworks in alphabetical order' do

    # User Story 16, Sort Artist's Artwork in Alphabetical Order by name (x2)
    # As a visitor
    # When I visit the Artist's artworks Index Page
    # Then I see a link to sort artworks in alphabetical order
    # When I click on the link
    # I'm taken back to the Artist's artworks Index Page where I see all of the parent's children in alphabetical order

    visit "artists/#{@povi.id}/artworks"

    expect("Povichi").to appear_before("ABC")

    click_link "Sort in Alphabetical Order"

    expect("ABC").to appear_before("Kemonomimi")
    expect("Kemonomimi").to appear_before("Povichi")
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

    visit "/artists/#{povi.id}/artworks"

    click_link 'Edit Povichi V2'

    fill_in "name", with: "Povichi V2.1"

    click_button "Update Artwork"

    expect(current_path).to eq("/artworks/#{artwork.id}")
    expect(page).to have_content("Povichi V2.1")
  end

  it 'displays records over given threshold' do
    # User Story 21, Display Records Over a Given Threshold (x2)
    # As a visitor
    # When I visit the Parent's children Index Page
    # I see a form that allows me to input a number value
    # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    # Then I am brought back to the current index page with only the records that meet that threshold shown.
    visit "artists/#{@povi.id}/artworks"
    fill_in "artworks above", with: 35

    click_button "Submit"

    expect(page).to_not have_content("ABC")
    expect(page).to_not have_content("Povichi")
    expect(page).to have_content("Kemonomimi")
  end
end
