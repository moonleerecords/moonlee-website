class CreateArtistMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_members do |t|
      t.references :artist, foreign_key: true
      t.references :member, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
