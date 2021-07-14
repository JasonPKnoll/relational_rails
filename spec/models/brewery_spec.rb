require 'rails_helper'

RSpec.describe Brewery do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :beers}
  end

  describe 'class methods' do
    it '.newest_first' do
      brewery1 = Brewery.create!(name: "Sierra Nevada Brewing Co",
                                 location: "Chico, CA",
                                 year_established: 1980,
                                 multiple_brewhouses: true
                               )
      brewery2 = Brewery.create!(name: "Bells Brewery",
                                location: "Kalamazoo, MI",
                                year_established: 1985,
                                multiple_brewhouses: true
                               )
      brewery3 = Brewery.create!(name: "Goldspot Brewing Co",
                                location: "Denver, CO",
                                year_established: 2016,
                                multiple_brewhouses: false
                               )

      expect(Brewery.newest_first).to eq([brewery3, brewery2, brewery1])
    end
  end
end
