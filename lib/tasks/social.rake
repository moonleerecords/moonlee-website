namespace :social do
  desc 'Fetch latest posts from Instagram'
  task fetch_instagram: :environment do
    instagram_media = Instagram::Media.new

    media = instagram_media.media

    media['items'].first(4).each do |media_item|
      social_post = find_or_create_instagram_post(media_item)
      social_post.save!
      puts "Updated `#{social_post.link}` from Instagram"
    end
  end

  desc 'Fetch latest posts from Youtube'
  task fetch_youtube: :environment do
    moonlee_channel = Yt::Channel.new url: 'http://youtube.com/moonleerecords'

    moonlee_channel.videos.first(2).each do |video|
      social_post = find_or_create_youtube_post(video)
      social_post.save!
      puts "Updated `#{social_post.link}` from Youtube"
    end
  end

  private

  def find_or_create_instagram_post(media_item)
    social_post = SocialPost.find_or_create_by(external_id: media_item['id'])
    social_post.source = SocialPost::SOURCE_INSTAGRAM
    social_post.link = media_item['link']
    social_post.text = media_item['caption']['text']
    social_post.media = media_item['images']['low_resolution']['url']
    social_post.published_at = Time.at(media_item['created_time'].to_i).to_datetime
    social_post
  end

  def find_or_create_youtube_post(video)
    social_post = SocialPost.find_or_create_by(external_id: video.id)
    social_post.source = SocialPost::SOURCE_YOUTUBE
    social_post.link = sprintf('https://www.youtube.com/watch?v=%s', video.id)
    social_post.text = video.title
    social_post.media = video.embed_html.gsub(/width="(\d+)"/, 'width="100%"').gsub(/height="(\d+)"/, 'height="100%"')
    social_post.published_at = video.published_at
    social_post
  end
end
