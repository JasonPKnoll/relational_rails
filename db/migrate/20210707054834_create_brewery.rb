class CreateBrewery < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :location
      t.integer :year_established

      t.timestamps
    end
  end
end