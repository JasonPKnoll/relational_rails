class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.boolean :for_sale

      t.timestamps
    end
  end
end
