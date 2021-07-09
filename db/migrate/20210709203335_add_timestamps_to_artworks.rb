class AddTimestampsToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :created_at, :datetime, null: false
    add_column :artworks, :updated_at, :datetime, null: false
  end
end
