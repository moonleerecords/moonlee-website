class CreateArtistsReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :artists_releases, id: false do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :release, index: true
    end
  end
end
