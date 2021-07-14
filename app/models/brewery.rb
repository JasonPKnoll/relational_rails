class Brewery < ApplicationRecord
  validates_presence_of :name
  has_many :beers

  def self.newest_first
    order('breweries.created_at DESC')
  end
end
