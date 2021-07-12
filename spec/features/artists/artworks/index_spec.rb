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

    expect(current_path).to eq("artists/#{@povi.id}")
    expect(page).to have_content("Povichi V2")
  end
end
