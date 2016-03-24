class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :catalog_number
      t.date :release_date
      t.text :description
      t.text :tracklist
      t.string :bandcamp_url
      t.text :additional_info

      t.timestamps
    end
  end
end
