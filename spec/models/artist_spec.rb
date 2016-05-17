require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'on saving' do
    it 'should save Artist if all validations pass' do
      artist = Artist.new
      artist.name = 'Repetitor'

      expect(artist.valid?).to eq(true)
    end
  end
end
