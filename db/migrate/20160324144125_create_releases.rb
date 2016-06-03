class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :catalog_number
      t.date :release_date
      t.text :description
      t.text :tracklist
      t.string :for_fans_of
      t.string :bandcamp_url
      t.text :bandcamp_player
      t.boolean :internal, default: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
