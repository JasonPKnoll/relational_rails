class Artwork < ApplicationRecord
  belongs_to :artist

  def self.sort_alphabetically
    all.order("name")
  end
end
