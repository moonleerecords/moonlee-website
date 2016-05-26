class CreateArtistEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_events do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
