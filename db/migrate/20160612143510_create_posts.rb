class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.string :visibility
      t.boolean :records, default: false
      t.boolean :booking, default: false
      t.datetime :published_at
      t.string :tags, array: true
      t.string :categories, array: true

      t.timestamps
    end
    add_index :posts, :tags, using: 'gin'
    add_index :posts, :categories, using: 'gin'
    add_attachment :posts, :image
  end
end
