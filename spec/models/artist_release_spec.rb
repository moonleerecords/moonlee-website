require 'rails_helper'

RSpec.describe ArtistRelease, type: :model do
  before(:context) do
    @artist = Artist.new
    @artist.name = 'Repetitor'
    @artist.save

    @release = Release.new
    @release.title = 'Dobrodošli na okean'
    @release.catalog_number = 'HMRL028'
    @release.release_date = Date.new(2012, 11, 29)
    @release.save
  end

  context 'on saving' do
    it 'should save ArtistRelease if all validations pass' do
      artist_release = ArtistRelease.new
      artist_release.artist = @artist
      artist_release.release = @release
      artist_release.save

      expect(Artist.count).to eq(1)
      expect(Release.count).to eq(1)
      expect(ArtistRelease.count).to eq(1)
    end
  end
end
