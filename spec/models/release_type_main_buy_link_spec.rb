require 'rails_helper'

RSpec.describe ReleaseTypeMainBuyLink, type: :model do
  before(:context) do
    @release = Release.new
    @release.title = 'Dobrodošli na okean'
    @release.catalog_number = 'HMRL028'
    @release.release_date = Date.new(2012, 11, 29)
    @release.save

    @release_type = ReleaseType.new
    @release_type.release = @release
    @release_type.format = 'lp'
    @release_type.save
  end

  context 'on saving' do
    it 'should save ReleaseTypeMainBuyLink if all validations pass' do
      release_type_main_buy_link = ReleaseTypeMainBuyLink.new
      release_type_main_buy_link.release_type = @release_type
      release_type_main_buy_link.buy_url = 'https://moonleerecords.bandcamp.com/album/dobrodo-li-na-okean'
      release_type_main_buy_link.save

      expect(ReleaseTypeMainBuyLink.count).to eq(1)
    end
  end
end
