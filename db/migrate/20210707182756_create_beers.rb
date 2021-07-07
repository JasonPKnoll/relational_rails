class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.float :abv
      t.integer :ibu

      t.timestamps
    end
  end
end
