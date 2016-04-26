class CreateReleaseTypeMainBuyLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :release_type_main_buy_links do |t|
      t.references :release_type, foreign_key: true
      t.string :buy_url

      t.timestamps
    end
  end
end
