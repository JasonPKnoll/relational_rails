require 'rails_helper'

RSpec.describe Beer do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

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

    it '.sort' do
      bells = Brewery.create!(name: "Bells Brewery",
                                location: "Kalamazoo, MI",
                                year_established: 1985,
                                multiple_brewhouses: true
                              )
      two_hearted = bells.beers.create!(name: "Two Hearted Ale",
                          style: "American IPA",
                          abv: 7.0,
                          ibu: 55,
                          non_alcoholic: false
                        )
      oberon = bells.beers.create!(name: "Oberon Ale",
                          style: "American Pale Wheat",
                          abv: 5.8,
                          ibu: 0,
                          non_alcoholic: false
                        )
      pooltime = bells.beers.create!(name: "Pooltime Ale",
                          style: "Wheat Beer",
                          abv: 5.0,
                          ibu: 0,
                          non_alcoholic: false
                        )
      expect(Beer.sort_beers_by_name).to eq([oberon, pooltime, two_hearted])
    end

    it '.non_alcoholic_beers' do
      brewery1 = Brewery.create!(name: "Bells Brewery",
                                location: "Kalamazoo, MI",
                                year_established: 1985,
                                multiple_brewhouses: true
                              )
      beer1 = brewery1.beers.create!(name: "Two Hearted Ale",
                          style: "American IPA",
                          abv: 7.0,
                          ibu: 55,
                          non_alcoholic: false
                        )
      brewery2 = Brewery.create!(name: "Athletic Brewing Co",
                                location: "Stratford, CT",
                                year_established: 2018,
                                multiple_brewhouses: false
                              )
      beer2 = brewery2.beers.create!(name: "Run Wild IPA",
                          style: "IPA",
                          abv: 0.4,
                          ibu: 35,
                          non_alcoholic: true
                        )
      beer3 = brewery2.beers.create!(name: "All Out Stout",
                          style: "Stout",
                          abv: 0.3,
                          ibu: 10,
                          non_alcoholic: true
                        )
      expect(Beer.non_alcoholic_beers.length).to eq(2)
      expect(Beer.non_alcoholic_beers).to eq([beer2, beer3])
    end

    it '.search_by_ibus' do
      brewery = Brewery.create!(name: "Bells Brewery",
                                location: "Kalamazoo, MI",
                                year_established: 1985,
                                multiple_brewhouses: true
                              )
      beer1 = brewery.beers.create!(name: "Two Hearted Ale",
                          style: "American IPA",
                          abv: 7.0,
                          ibu: 55,
                          non_alcoholic: true
                        )
      beer2 = brewery.beers.create!(name: "Oberon Ale",
                          style: "American Pale Wheat",
                          abv: 5.8,
                          ibu: 0,
                          non_alcoholic: false
                        )
      beer3 = brewery.beers.create!(name: "Pooltime Ale",
                          style: "Wheat Beer",
                          abv: 5.0,
                          ibu: 0,
                          non_alcoholic: false
                        )


      expect(Beer.search_by_ibus(40).length).to eq(1)
      expect(Beer.search_by_ibus(40)).to eq([beer1])
    end
  end
end
