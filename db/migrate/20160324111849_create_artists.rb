# TODO: migration version will get removed when Rails 5 gets out of beta
class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :origin
      t.string :genre
      t.string :formed
      t.string :disbanded
      t.integer :songkick_id
      t.boolean :active, default: true
      t.boolean :booking, default: false

      t.timestamps
    end
  end
end
