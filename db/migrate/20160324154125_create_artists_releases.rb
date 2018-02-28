class CreateArtistsReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :artists_releases, id: false do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :release, index: true
    end
    add_index :artists_releases, [:artist_id, :release_id], unique: true
  end
end
