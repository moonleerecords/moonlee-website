require 'songkickr'

module Songkick
  class EventsFetcher
    EVENT_TYPE_CONCERT = 'Concert'.freeze
    EVENT_TYPE_FESTIVAL = 'Festival'.freeze

    def fetch_upcoming_events
      songkick = Songkickr::Remote.new ENV['SONGKICK_API_KEY']
      artists = Artist.with_songkick_id

      # TODO: remove unexisting/cancelled event. Need administration
      # Example of cancelled event: https://www.songkick.com/concerts/29403949-repetitor-at-unknown-venue?utm_source=20659&utm_medium=partner
      # TODO: write tests for class

      artists.each do |artist|
        performances = songkick.artist_performances(artist.songkick_id)

        next unless performances.status == 'ok' && performances.results.count > 0

        update_or_save_events(performances, artist)
      end
    end

    private

    def update_or_save_events(performances, artist)
      performances.results.each do |songkick_performance|
        begin
          event = find_or_create_event(songkick_performance, artist)
          Rails.logger.info "Updated event `#{event.songkick_url}` for #{artist.name}"
        rescue StandardError => e
          raise Exceptions::SongkickError, "An error of type `#{e.class}` happened, message is `#{e.message}`"
        end
      end
    end

    def find_or_create_venue(songkick_event)
      songkick_id = songkick_event.venue.id.nil? ? songkick_event.venue.metro_area.id : songkick_event.venue.id
      venue = Venue.find_or_create_by(songkick_id: songkick_id)
      venue.name = venue_name(songkick_event)
      venue.songkick_url = songkick_event.venue.uri.nil? ? songkick_event.venue.metro_area.uri : songkick_event.venue.uri
      venue.city = songkick_event.location.city.split(',')[0]
      venue.country = songkick_event.venue.metro_area.country
      venue.country_code = country_code(songkick_event.venue.metro_area.country)
      venue.lng, venue.lat = lat_lng(songkick_event)
      venue.save!
      venue
    end

    def find_or_create_event(songkick_performance, artist)
      songkick_event = songkick_performance.event
      venue = find_or_create_venue(songkick_event)
      event = Event.find_or_create_by(songkick_id: songkick_event.id, artist: artist)
      event.artist = artist
      event.venue = venue
      event.event_type = songkick_event.type
      event.start_date = artist_performance_date(songkick_performance, songkick_event)
      event.songkick_url = songkick_event.uri
      save_or_destroy_event(event, songkick_event)
      event
    end

    def save_or_destroy_event(event, songkick_event)
      if songkick_event.status == 'cancelled' && event.persisted?
        event.destroy
      else
        event.save!
      end
    end

    def venue_name(songkick_event)
      songkick_event.type == 'Festival' ? songkick_event.display_name : songkick_event.venue.display_name
    end

    def lat_lng(songkick_event)
      if songkick_event.venue.lat.nil? && songkick_event.venue.lng.nil?
        response = Geocoder.search(songkick_event.location.city.split(',')[0])
        return 0, 0 if response.nil? || response.empty?
        return response.first.coordinates
      end
      [songkick_event.venue.lat, songkick_event.venue.lng]
    end

    def artist_performance_date(songkick_performance, songkick_event)
      if songkick_event.type == EVENT_TYPE_FESTIVAL
        return songkick_performance.date.to_date if songkick_performance.date
      end
      songkick_event.start.to_date
    end

    def country_code(country_name)
      country_name = countries_mapper(country_name)
      response = Geocoder.search(country_name)
      return nil if response.nil? || response.empty?
      response.first.country_code.upcase
    end

    def countries_mapper(country_name)
      {
        'Macedonia, The Former Yugoslav Republic Of' => 'Macedonia'
      }[country_name] || country_name
    end
  end
end
