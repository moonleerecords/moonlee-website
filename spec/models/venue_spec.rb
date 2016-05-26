require 'rails_helper'

RSpec.describe Venue, type: :model do
  context 'on saving' do
    it 'should save Venue if all validations pass' do
      venue = Venue.new
      venue.name = 'Klub Gromka'
      venue.city = 'Ljubljana'
      venue.lng = '14.50575'
      venue.lat = '46.05695'
      venue.country = 'Slovenia'
      venue.country_code = 'SI'

      expect(venue.valid?).to eq(true)
    end
  end
end
