class Artist < ApplicationRecord
  has_many :artworks

  def total_number_of_artworks
    artworks.count
  end
end
