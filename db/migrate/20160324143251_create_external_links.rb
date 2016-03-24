class CreateExternalLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :external_links do |t|
      t.references :artist, foreign_key: true
      t.string :type
      t.string :url

      t.timestamps
    end
  end
end
