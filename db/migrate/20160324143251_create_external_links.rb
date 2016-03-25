class CreateExternalLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :external_links do |t|
      t.references :artist, foreign_key: true
      t.string :url
      t.string :url_type

      t.timestamps
    end
  end
end
