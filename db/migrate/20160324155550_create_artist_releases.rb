class CreateArtistReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_releases do |t|
      t.references :artist, index: true
      t.references :release, index: true

      t.timestamps null: false
    end
  end
end
