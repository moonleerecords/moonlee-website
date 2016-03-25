require 'rails_helper'

RSpec.describe ExternalLink, type: :model do
  before(:context) do
    @artist = Artist.new
    @artist.name = 'Repetitor'
    @artist.save
  end

  context 'on saving' do
    it 'should save ExternalLink if all validations pass' do
      external_link = ExternalLink.new
      external_link.artist = @artist
      external_link.url = 'https://www.facebook.com/repetitorbgd'
      external_link.url_type = 'facebook'
      external_link.save

      expect(Artist.count).to eq(1)
      expect(ExternalLink.count).to eq(1)
    end
  end
end
