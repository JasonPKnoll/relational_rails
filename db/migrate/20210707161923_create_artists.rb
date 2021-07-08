class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :description
      t.integer :years_experience
      t.boolean :comissions_open

      t.timestamps
    end
  end
end
