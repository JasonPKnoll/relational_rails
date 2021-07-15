require 'rails_helper'

RSpec.describe 'brewery creation page' do
  it 'links to the new page from brewery index' do

    visit '/breweries'

    click_link("New Brewery")

    expect(current_path).to eq('/breweries/new')
  end

  it 'can create new brewery' do
    visit '/breweries/new'

    fill_in('name', with: 'New Glarus Brewing')
    fill_in('location', with: 'New Glarus, WI')
    fill_in('year_established', with: 1993)
    select('No', :from => "multiple_brewhouses")
    click_button('Create Brewery')

    expect(current_path).to eq('/breweries')
    expect(page).to have_content('New Glarus Brewing')
  end

  it 'displays links to all index pages' do
    # user stories 8 and 9
    visit "/breweries/new"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end
end
