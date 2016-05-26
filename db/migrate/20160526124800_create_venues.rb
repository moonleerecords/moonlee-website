class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.integer :songkick_id
      t.string :name
      t.string :songkick_url
      t.string :city
      t.string :country_code
      t.string :lng
      t.string :lat

      t.timestamps
    end
  end
end
