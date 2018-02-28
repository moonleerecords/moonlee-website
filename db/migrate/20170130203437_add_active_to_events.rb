class AddActiveToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :active, :boolean, default: true
  end
end
