require 'songkickr'

module Songkick
  class EventsFetcher
    def fetch_upcoming_events
      songkick = Songkickr::Remote.new ENV['SONGKICK_API_KEY']
      artists = Artist.with_songkick_id

      # TODO: deal with festival end date and date when band is actually performing
      # TODO: remove unexisting event - how?
      # TODO: write tests for class

      artists.each do |artist|
        songkick_events = songkick.artist_events(artist.songkick_id)

        next unless songkick_events.status == 'ok' && songkick_events.results.count > 0

        update_or_save_events(songkick_events, artist)
      end
    end

    private

    def update_or_save_events(songkick_events, artist)
      songkick_events.results.each do |songkick_event|
        begin
          event = find_or_create_event(songkick_event, artist)
          logger.info "Updated event `#{event.songkick_url}` for #{artist.name}"
        rescue StandardError => e
          raise Exceptions::SongkickError, "An error of type `#{e.class}` happened, message is `#{e.message}`\n#{songkick_event.to_json}"
        ensure
          next
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

    def find_or_create_event(songkick_event, artist)
      venue = find_or_create_venue(songkick_event)
      event = Event.find_or_create_by(songkick_id: songkick_event.id, artist: artist)
      event.artist = artist
      event.venue = venue
      event.event_type = songkick_event.type
      event.start_date = songkick_event.start.to_date
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
        return response[0].data['geometry']['location']['lat'], response[0].data['geometry']['location']['lng']
      end
      [songkick_event.venue.lat, songkick_event.venue.lng]
    end

    def country_code(country_name)
      country_name = countries_mapper(country_name)
      response = Geocoder.search(country_name)
      return nil if response.nil? || response.empty?
      response[0].data['address_components'][0]['short_name']
    end

    def countries_mapper(country_name)
      {
        'Macedonia, The Former Yugoslav Republic Of' => 'Macedonia'
      }[country_name] || country_name
    end
  end
end
