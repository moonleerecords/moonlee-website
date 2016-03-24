class CreateArtistReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_releases do |t|
      t.references :artist, foreign_key: true
      t.references :release, foreign_key: true

      t.timestamps
    end
  end
end
