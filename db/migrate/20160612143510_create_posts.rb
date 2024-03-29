class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.string :youtube_video
      t.text :body
      t.string :visibility
      t.boolean :records, default: true
      t.boolean :booking, default: false
      t.datetime :published_at
      t.string :tags, array: true, default: []
      t.string :categories, array: true, default: []

      t.timestamps
    end
    add_index :posts, :tags, using: 'gin'
    add_index :posts, :categories, using: 'gin'
    add_attachment :posts, :image
  end
end
