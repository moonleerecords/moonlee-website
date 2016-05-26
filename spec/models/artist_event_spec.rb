require 'rails_helper'

RSpec.describe ArtistEvent, type: :model do
  before(:context) do
    @artist = Artist.new
    @artist.name = 'Repetitor'
    @artist.save

    venue = Venue.new
    venue.name = 'Klub Gromka'
    venue.city = 'Ljubljana'
    venue.lng = '14.50575'
    venue.lat = '46.05695'
    venue.country_code = 'SI'
    venue.save

    @event = Event.new
    @event.venue = venue
    @event.start_date = Time.zone.today + 10.days
    @event.save
  end

  context 'on saving' do
    it 'should save ArtistEvent if all validations pass' do
      artist_event = ArtistEvent.new
      artist_event.artist = @artist
      artist_event.event = @event

      expect(artist_event.valid?).to eq(true)
    end
  end
end
