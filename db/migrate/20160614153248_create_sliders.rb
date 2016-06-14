class CreateSliders < ActiveRecord::Migration[5.0]
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :url
      t.integer :position
      t.boolean :active, default: true
      t.boolean :records, default: false
      t.boolean :booking, default: false

      t.timestamps
    end
    add_attachment :sliders, :image
  end
end
