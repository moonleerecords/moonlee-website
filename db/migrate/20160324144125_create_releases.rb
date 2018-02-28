class CreateReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :slug
      t.string :catalog_number
      t.date :release_date
      t.text :description
      t.text :tracklist
      t.string :genre
      t.string :for_fans_of
      t.string :quote
      t.string :bandcamp_url
      t.string :bandcamp_id
      t.text :bandcamp_player
      t.boolean :internal, default: true
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :releases, :slug, unique: true
    add_attachment :releases, :cover
  end
end
