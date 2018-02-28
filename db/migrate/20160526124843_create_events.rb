class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :artist, foreign_key: true
      t.references :venue, foreign_key: true
      t.integer :songkick_id
      t.string :event_type
      t.date :start_date
      t.date :end_date
      t.string :songkick_url
      t.string :facebook_url
      t.string :lastfm_url

      t.timestamps
    end
  end
end
