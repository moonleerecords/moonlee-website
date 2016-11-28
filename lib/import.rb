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

    def external_links
      csv = parse_csv_file('external_links.csv')
      csv.each do |row|
        external_link = ExternalLink.find_or_initialize_by(artist_id: row['artist'], url_type: row['url_type'])
        external_link.url = row['url']
        external_link.save
      end
    end

    def members
      csv = parse_csv_file('members.csv')
      csv.each do |row|
        member = Member.find_or_initialize_by(name: row['name'])
        member.save

        # save ArtistMember
        3.times do |i|
          artist_id = row["artist#{i}"]
          role = row["artist#{i}"]

          unless artist_id
            next
          end

          artist_member = ArtistMember.find_or_initialize_by(artist_id: artist_id, member_id: member.id)
          artist_member.role = role
          artist_member.save
        end
      end
    end

    def releases
      csv = parse_csv_file('releases.csv')
      csv.each do |row|
        if row['cover']
          row['cover'] = File.new(Rails.root.join('lib', 'seeds', 'images', 'releases', row['cover']))
        end

        release = Release.find_or_initialize_by(catalog_number: row['catalog_number'])
        release.assign_attributes(row.to_hash)
        release.save



        # TODO: add release types to releases.csv
      end
    end

    def artists_releases
      csv = parse_csv_file('artist_releases.csv')
      csv.each do |row|
        artist_release = ArtistRelease.find_or_initialize_by(artist_id: row['artist'], release_id: row['release'])
        artist_release.save
      end
    end

    def releases_reviews
      csv = parse_csv_file('releases_reviews.csv')
      csv.each do |row|
        release_review = ReleaseReview.find_or_initialize_by(release_id: row['release'], title: row['title'])
        release_review.assign_attributes(row.to_hash)
        release_review.save
      end
    end

    def releases_buy_links
      # TODO:
    end

    def posts
      # TODO:
      # wp_post_type = post
      # wp_post_status = publish
    end

    def sliders
      # TODO
    end

    private

    def parse_csv_file(file)
      csv_text = File.read(Rails.root.join('lib', 'seeds', file))
      CSV.parse(csv_text, :headers => true)
    end
  end
end
