require 'songkickr'

namespace :songkick do
  task fetch_upcoming_events: :environment do
    remote = Songkickr::Remote.new ENV['SONGKICK_API_KEY']
    artists = Artist.with_songkick_id

    artists.each do |artist|
      songkick_events = remote.artist_events(artist.songkick_id)
      next unless songkick_events.status == 'ok' && songkick_events.results.count > 0

      songkick_events.results.each do |songkick_event|
        venue = find_or_create_venue(songkick_event)
        venue.save
        event = find_or_create_event(songkick_event, venue)
        event.save
        artist_event = find_or_create_artist_event(artist, event)
        artist_event.save
      end
    end

    # TODO: deal with festival end date and date when band is actually performing
    # TODO: check for cancelled events and then do not show them anymore
    # TODO: write test
  end

  def find_or_create_venue(songkick_event)
    venue = Venue.find_or_create_by(songkick_id: songkick_event.venue.id)
    venue.name = songkick_event.venue.display_name
    venue.songkick_url = songkick_event.venue.uri
    venue.city = songkick_event.location.city
    venue.country = songkick_event.venue.metro_area.country
    venue.country_code = country_code(songkick_event.venue.metro_area.country)
    venue.lng = songkick_event.venue.lng
    venue.lat = songkick_event.venue.lat
    venue
  end

  def find_or_create_event(songkick_event, venue)
    event = Event.find_or_create_by(songkick_id: songkick_event.id)
    event.venue = venue
    event.event_type = songkick_event.type
    event.start_date = songkick_event.start.to_date
    event.songkick_url = songkick_event.uri
    event
  end

  def find_or_create_artist_event(artist, event)
    ArtistEvent.find_or_create_by(artist_id: artist.id, event_id: event.id)
  end

  def country_code(country_name)
    country = ISO3166::Country.find_country_by_name(country_name)
    country.alpha2
  end
end
