class AddLinkableToExternalLinks < ActiveRecord::Migration[5.1]
  def up
    change_table :external_links do |t|
      t.references :linkable, polymorphic: true
    end
  end

  def down
    change_table :external_links do |t|
      t.remove_references :linkable, polymorphic: true
    end
  end
end
