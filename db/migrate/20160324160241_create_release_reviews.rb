class CreateReleaseReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :release_reviews do |t|
      t.string :title
      t.references :release, foreign_key: true
      t.string :url
      t.text :quote
      t.boolean :visible

      t.timestamps
    end
  end
end
