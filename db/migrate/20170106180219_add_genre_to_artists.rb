class AddGenreToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :genre, :string, after: :origin
  end
end
