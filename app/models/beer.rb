class Beer < ApplicationRecord
  belongs_to :brewery

  def self.beer_count
    all.length
  end
end
