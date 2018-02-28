class CreateSlides < ActiveRecord::Migration[5.1]
  def change
    create_table :slides do |t|
      t.string :title
      t.string :url
      t.integer :position
      t.boolean :active, default: true
      t.boolean :records, default: false
      t.boolean :booking, default: false

      t.timestamps
    end
    add_attachment :slides, :image
  end
end
