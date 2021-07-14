class Artwork < ApplicationRecord
  belongs_to :artist

  def self.sort_alphabetically
    all.order("name")
  end

  def self.sort_by_price
    all.where(price: session[:price])
  end
end
