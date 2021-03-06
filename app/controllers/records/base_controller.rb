module Records
  class BaseController < ApplicationController
    layout 'records/layouts/application'

    def upcoming_events(limit = nil)
      @upcoming_events = Event.on_records.upcoming_per_date.limit(limit)
    end

    def promoted_releases(latest_count = 5)
      @upcoming_releases = Release.upcoming
      @latest_releases = (@upcoming_releases | Release.latest).take(latest_count)
    end

    def social_posts
      @social_posts = SocialPost.twitter.take(1) + SocialPost.instagram.take(2) + SocialPost.youtube.take(2)
    end

    def custom_header(title, text, image = nil)
      @custom_header = {
        title: title,
        text: text,
        image: image
      }
    end

    def meta_tags(title, description = '', image = nil)
      image = '/assets/missing.png' if image.nil?
      @meta_tags = {
        title: title == '' ? 'Moonlee Records' : "Moonlee Records - #{title}",
        description: description == '' ? 'Moonlee Records is an independent record label from Ljubljana, Slovenia. Established in 2004.' : description,
        image: "#{request.base_url}#{image}",
        url: request.original_url
      }
    end
  end
end
