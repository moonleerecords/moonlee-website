class CreateSocialPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :social_posts do |t|
      t.string :source
      t.string :url
      t.string :external_id
      t.text :text
      t.text :media
      t.text :video_media
      t.datetime :published_at
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :social_posts, [:source, :external_id], :unique => true
  end
end
