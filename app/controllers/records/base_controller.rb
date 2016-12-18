module Records
  class BaseController < ApplicationController
    layout 'records/layouts/application'

    def upcoming_events(limit = nil)
      @upcoming_events = Event.on_records.upcoming.limit(limit)
    end

    def upcoming_events_per_artist(limit = nil)
      @upcoming_events = Event.on_records.upcoming.group_by { |event| event.artist.name }
      if limit
        @upcoming_events .each do |key, _|
          @upcoming_events[key] = @upcoming_events[key].slice(0, limit)
        end
      end
      @upcoming_events
    end

    def promoted_releases(latest_count = 5)
      @upcoming_releases = Release.upcoming
      @fresh_releases = Release.fresh
      @latest_releases = (Release.latest - @fresh_releases).take(latest_count)
    end

    def social_posts
      @social_posts = SocialPost.twitter.take(1) + SocialPost.instagram.take(2) + SocialPost.youtube.take(2)
    end

    def meta_tags(title, description = '', image = nil)
      image = '/assets/missing.png' if image.nil?
      @meta_tags = {
        title: title == '' ? 'Moonlee Records' : "Moonlee Records - #{title}",
        description: description == '' ? 'Moonlee Records is an independent record label from Ljubljana, Slovenia. Established in 2004.' : description,
        image: "#{request.base_url}#{image}",
        url: request.original_url,
      }
    end
  end
end
