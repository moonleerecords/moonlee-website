class AddArtistsNamesToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :artists_names, :string

    Release.all.each { |release| release.save! }
  end
end
