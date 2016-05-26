require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:context) do
    @venue = Venue.new
    @venue.name = 'Klub Gromka'
    @venue.city = 'Ljubljana'
    @venue.lng = '14.50575'
    @venue.lat = '46.05695'
    @venue.country_code = 'SI'
    @venue.save
  end

  context 'on saving' do
    it 'should save Event if all validations pass' do
      event = Event.new
      event.venue = @venue
      event.start_date = Time.zone.today + 10.days

      expect(event.valid?).to eq(true)
    end
  end
end
