class CreateSocialPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :social_posts do |t|
      t.string :source
      t.string :link
      t.string :external_id
      t.text :text
      t.text :media
      t.datetime :published_at
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :social_posts, [:source, :external_id], :unique => true
  end
end
