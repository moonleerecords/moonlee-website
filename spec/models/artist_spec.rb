require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'on saving' do
    it 'should not save artist without a name' do
      artist = Artist.new
      artist.name = 'Repetitor'
      artist.save

      expect(Artist.count).to eq(1)
    end
  end
end
