class Beer < ApplicationRecord
  validates_presence_of :name
  belongs_to :brewery

  def self.beer_count
    all.length
  end

  def self.sort_beers_by_name
    order(:name)
  end

  def self.non_alcoholic_beers
    where(non_alcoholic: true)
  end

  # def self.search_by_ibus
  #   where("ibu > ?", params[:search])
  # end
end
