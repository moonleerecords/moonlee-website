require 'rails_helper'

RSpec.describe ExternalLink, type: :model do
  before(:context) do
    @artist = Artist.new
    @artist.name = 'Repetitor'
    @artist.save
  end

  context 'on saving' do
    it 'should be connected to artist, have a proper link type and present url' do
      external_link = ExternalLink.new
      external_link.artist = @artist
      external_link.type = 'facebook'
      external_link.url = 'https://www.facebook.com/repetitorbgd'
      external_link.save

      # TODO: undefined method types
      # TODO: finish tests

      byebug

      expect(Artist.count).to eq(1)
      expect(ExternalLink.count).to eq(1)
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
