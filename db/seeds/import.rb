module Import
  class Importer
    def artists
      csv = parse_csv_file('artists.csv')
      csv.each do |row|
        if row['image']
          row['image'] = File.new(Rails.root.join('lib', 'seeds', 'images', 'artists', row['image']))
        end

        artist = Artist.find_or_initialize_by(name: row['name'])
        artist.assign_attributes(row.to_hash)
        artist.save
      end
    end

    def releases
      csv = parse_csv_file('releases.csv')
      csv.each do |row|
        if row['cover']
          row['cover'] = File.new(Rails.root.join('lib', 'seeds', 'images', 'releases', row['cover']))
        end

        release = Release.find_or_initialize_by(title: row['title'])
        release.assign_attributes(row.to_hash)
        release.save
      end
    end

    def artist_releases
      csv = parse_csv_file('artist_releases.csv')
      csv.each do |row|
        artist_release = ArtistRelease.find_or_initialize_by(artist_id: row['artist'], release_id: row['release'])
        artist_release.save
      end
    end

    private

    def parse_csv_file(file)
      csv_text = File.read(Rails.root.join('lib', 'seeds', file))
      CSV.parse(csv_text, :headers => true)
    end
  end
end
