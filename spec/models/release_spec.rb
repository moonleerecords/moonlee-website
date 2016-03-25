require 'rails_helper'

RSpec.describe Release, type: :model do
  before(:context) do
    @artist = Artist.new
    @artist.name = 'Repetitor'
    @artist.save
  end

  context 'on saving' do
    it 'should save Release if all validations pass' do
      @release = Release.new
      @release.title = 'Dobrodošli na okean'
      @release.catalog_number = 'HMRL028'
      @release.release_date = Date.new(2012, 11, 29)
      @release.save

      expect(Release.count).to eq(1)
    end
  end
end
