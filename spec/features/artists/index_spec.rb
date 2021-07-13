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
    povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    megan = Artist.create!(name: "Megan",
                          description: "3D artists",
                          years_experience: 2,
                          comissions_open: true)

    srgrafo = Artist.create!(name: "SrGrafo",
                            description: "digital artists",
                            years_experience: 5,
                            comissions_open: false)

    visit "/artists"

    expect(page).to have_content(povi.name)
    expect(page).to have_content(megan.name)
    expect(page).to have_content(srgrafo.name)

    expect("Megan").to appear_before("Povi")
    expect("SrGrafo").to appear_before("Megan")
  end

  it 'displays artists index link on all pages' do

    # => Story 9
    # => As a visitor
    # => When I visit any page
    # => I see a link at the top of the page that takes me to artists index
    visit "/" # welcome page
    expect(page).to have_link("Artists Index")

    visit "/artworks"
    expect(page).to have_link("Artists Index")

    visit "/artists"
    expect(page).to have_link("Artists Index")

    visit "/easteregg"
    expect(page).to have_link("Artists Index")
  end

  describe 'can create a new artist' do
    # Story 11
    # As a visitor
    # When I visit the ARTIST Index page
    # Then I see a link to create a new ARTIST record, "New ARTIST"
    # When I click this link
    # Then I am taken to '/artists/new' where I  see a form for a new artist record
    # When I fill out the form with a new artist's attributes:
    # And I click the button "Create ARTIST" to submit the form
    # Then a `POST` request is sent to the '/artists' route,
    # a new artist record is created,
    # and I am redirected to the ARTIST Index page where I see the new ARTIST displayed.

    it 'can link to new artist from artists index' do
      visit "/artists"

      click_link "New Artist"

      expect(page).to have_content("Name")
      expect(page).to have_content("Description")
      expect(page).to have_content("Years Experience")
      expect(page).to have_content("Are Comissions Open?")
    end

    it 'can create a new artist' do
      visit "/artists/new"

      fill_in "name", with: "Megan"
      fill_in "description", with: "3D avatar creator"
      click_button "Create Artist"

      expect(current_path).to eq("/artists")
      expect(page).to have_content("Megan")
    end
  end

  it 'can update artists from index page' do
    # User Story 17, Artist Update From Artist Index Page (x2)
    # As a visitor
    # When I visit the artist index page
    # Next to every artist, I see a link to edit that artist's info
    # When I click the link
    # I should be taken to that artists edit page where I can update its information just like in User Story 4

    megan = Artist.create!(name: "Meg",
                          description: "3D artists",
                          years_experience: 2,
                          comissions_open: true)

    srgrafo = Artist.create!(name: "SrGrafo",
                            description: "digital artists",
                            years_experience: 5,
                            comissions_open: false)

    visit "/artists/"
    save_and_open_page
    click_link "Edit Meg"

    fill_in "name", with: "Megan"
    click_button "Update Artist"

    expect(current_path).to eq("/artists/#{megan.id}")
    expect(page).to have_content("Megan")
  end
end
