class CreateBrewery < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.integer :year_established
      t.boolean :in_colorado
    end
  end
end
