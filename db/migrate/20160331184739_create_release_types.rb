class CreateReleaseTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :release_types do |t|
      t.references :release, foreign_key: true
      t.string :format

      t.timestamps
    end
  end
end
