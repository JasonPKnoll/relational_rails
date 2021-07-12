class Beer < ApplicationRecord
  belongs_to :brewery

  def self.beer_count
    all.length
  end

  def self.sort_beers_by_name
    all.order(:name)
  end
end
