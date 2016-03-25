require 'rails_helper'

RSpec.describe ArtistMember, type: :model do
  before(:context) do
    @artist = Artist.new
    @artist.name = 'Repetitor'
    @artist.save

    @member = Member.new
    @member.name = 'Boris Vlastelica'
    @member.save
  end

  context 'on saving' do
    it 'should save ArtistMember if all validations pass' do
      artist_member = ArtistMember.new
      artist_member.artist = @artist
      artist_member.member = @member
      artist_member.save

      expect(Artist.count).to eq(1)
      expect(Member.count).to eq(1)
      expect(ArtistMember.count).to eq(1)
    end
  end
end
