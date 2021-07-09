require 'rails_helper'

RSpec.describe Beer do
  describe 'relationships' do
    it {should belong_to :brewery}
  end

  describe 'class methods' do
    it '.beer_count' do
      bells = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985
                            )
      sierra = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980
                             )
      two_hearted = bells.beers.create!(name: "Two Hearted Ale",
                                        style: "American IPA",
                                        abv: 7.0,
                                        ibu: 55
                                      )
      hazy = sierra.beers.create!(name: "Hazy Little Thing",
                                  style: "New England IPA",
                                  abv: 6.7,
                                  ibu: 35
                                )
                                
      expect(Beer.beer_count).to eq(2)
    end
  end
end
