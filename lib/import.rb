module Import
  class Importer
    require 'nokogiri'
    require 'open-uri'

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

        # save artist members
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
        release_formats = row['release_formats'].split(',')

        if row['cover']
          row['cover'] = File.new(Rails.root.join('lib', 'seeds', 'images', 'releases', row['cover']))
        end

        row.delete('release_formats')

        release = Release.find_or_initialize_by(catalog_number: row['catalog_number'])
        release.assign_attributes(row.to_hash)
        release.save

        release_formats.each do |release_format|
          release_type = ReleaseType.find_or_initialize_by(release_id: release.id, release_format: release_format)
          release_type.save
        end
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
        row.delete('release')
        release_review.assign_attributes(row.to_hash)
        release_review.save
      end
    end

    def releases_buy_links
      csv = parse_csv_file('releases_buy_links.csv')
      csv.each do |row|
        release = Release.find(row['release'])
        release_type = ReleaseType.find_by(release: release, release_format: row['format'])

        release_type_buy_link = ReleaseTypeBuyLink.find_or_initialize_by(
          release_type: release_type,
          source: row['source'],
          buy_url: row['buy_url'],
          title: row['title']
        )

        release_type_buy_link.save
      end
    end

    def posts
      csv = parse_csv_file('posts.csv')
      csv.each do |row|
        unless row['wp_post_type'] == 'post' && row['wp_post_status'] == 'publish'
          next
        end

        content_html = Nokogiri::HTML.fragment(row['wp_post_content'])

        # if something fails, just ignore...
        begin
          image_source = nil
          content_html.search('img').each do |image|
            image_source = image['src']
            image.remove
            break
          end

          video_source = nil
          content_html.search('iframe').each do |video|
            video_source = video
            video.remove
            break
          end

          # TODO: attach video to post

          image_file = image_source ? File.new(open(image_source)) : nil

          Post.create(
            title: row['wp_post_title'],
            image: image_file,
            body: content_html,
            visibility: 'public',
            records: true,
            published_at: Time.strptime(row['wp_post_date'], '%Y-%m-%d %H:%M:%S'),
            tags: ['moonlee records'],
            categories: ['news']
          )
        rescue StandardError => _
          next
        end
      end
    end

    private

    def parse_csv_file(file)
      csv_text = File.read(Rails.root.join('lib', 'seeds', file))
      CSV.parse(csv_text, :headers => true)
    end
  end
end
