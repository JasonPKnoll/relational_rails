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

end
