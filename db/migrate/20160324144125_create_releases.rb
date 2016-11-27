class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :slug
      t.string :catalog_number
      t.date :release_date
      t.text :description
      t.text :tracklist
      t.string :for_fans_of
      t.string :bandcamp_url
      t.string :bandcamp_id
      t.boolean :internal, default: true
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :releases, :slug, unique: true
    add_attachment :releases, :cover
  end
end
