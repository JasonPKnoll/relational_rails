class Artwork < ApplicationRecord
  belongs_to :artist

  def self.sort_alphabetically
    all.order("name")
  end

  def self.search_by_price(num)
    where("price >= ?", num)
  end
end
