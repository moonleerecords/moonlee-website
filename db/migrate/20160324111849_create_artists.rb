class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :origin
      t.string :genre
      t.integer :formed
      t.integer :disbanded
      t.string :booking_agent
      t.string :quote
      t.integer :songkick_id
      t.boolean :active, default: true
      t.boolean :records, default: false
      t.boolean :booking, default: false

      t.timestamps
    end
    add_index :artists, :slug, unique: true
    add_attachment :artists, :image
  end
end
