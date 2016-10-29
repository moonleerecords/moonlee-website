namespace :social do
  desc 'Fetch latest posts from Instagram'
  task fetch_instagram: :environment do
    instagram_media = Instagram::Media.new

    media = instagram_media.media

    media['items'].first(4).each do |media_item|
      social_post = find_or_create_instagram_post(media_item)
      social_post.save!
      puts "Updated `#{social_post.url}` from Instagram"
    end
  end

  desc 'Fetch latest posts from Youtube'
  task fetch_youtube: :environment do
    moonlee_channel = Yt::Channel.new url: 'http://youtube.com/moonleerecords'

    moonlee_channel.videos.first(2).each do |video|
      social_post = find_or_create_youtube_post(video)
      social_post.save!
      puts "Updated `#{social_post.url}` from Youtube"
    end
  end

  private

  def find_or_create_instagram_post(media_item)
    social_post = SocialPost.find_or_create_by(external_id: media_item['id'])
    social_post.source = SocialPost::SOURCE_INSTAGRAM
    social_post.url = media_item['link']
    social_post.text = media_item['caption']['text']
    social_post.media = media_item['images']['low_resolution']['url']
    if media_item['videos']
      social_post.video_media = media_item['videos']['low_resolution']['url']
    end
    social_post.published_at = Time.at(media_item['created_time'].to_i).to_datetime
    social_post
  end

  def find_or_create_youtube_post(video)
    social_post = SocialPost.find_or_create_by(external_id: video.id)
    social_post.source = SocialPost::SOURCE_YOUTUBE
    social_post.url = sprintf('https://www.youtube.com/watch?v=%s', video.id)
    social_post.text = video.title
    social_post.media = prepare_iframe(video.embed_html, video.id)
    social_post.published_at = video.published_at
    social_post
  end

  def prepare_iframe(embed_html, video_id)
    embed_html.gsub!(/width="(\d+)"/, 'width="100%"').gsub!(/height="(\d+)"/, 'height="100%"')
    embed_html.gsub!(video_id, "#{video_id}?modestbranding=1&autohide=1&showinfo=0&controls=0")
  end
end
