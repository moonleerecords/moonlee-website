class RemoveArtistIdFromExternalLinks < ActiveRecord::Migration[5.1]
  def change
    remove_column :external_links, :artist_id, :bigint
  end
end
