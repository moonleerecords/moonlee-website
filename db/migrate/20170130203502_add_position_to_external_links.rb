class AddPositionToExternalLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :external_links, :position, :integer
  end
end
