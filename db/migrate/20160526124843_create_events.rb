class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :venue, foreign_key: true
      t.integer :songkick_id
      t.string :type
      t.date :start_date
      t.date :end_date
      t.string :songkick_url
      t.string :facebook_url
      t.string :lastfm_url

      t.timestamps
    end
  end
end
