require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'on saving' do
    it 'should save Artist if all validations pass' do
      artist = Artist.new
      artist.name = 'Repetitor'
      artist.save

      expect(Artist.count).to eq(1)
    end
  end
end
