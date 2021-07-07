require 'rails_helper'

RSpec.describe 'the beer show page' do
  it 'displays the beer name' do
    beer = Beer.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55)
    visit "/beers/#{beer.id}"

  end

  it 'displays the name of brewery for the beer' do

  end
end
