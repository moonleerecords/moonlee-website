require 'rails_helper'

RSpec.describe ReleaseTypeOtherBuyLink, type: :model do
  before(:context) do
    @release = Release.new
    @release.title = 'Dobrodošli na okean'
    @release.catalog_number = 'HMRL028'
    @release.release_date = Date.new(2012, 11, 29)
    @release.save

    @release_type = ReleaseType.new
    @release_type.release = @release
    @release_type.format = 'cd'
    @release_type.save
  end

  context 'on saving' do
    it 'should save ReleaseTypeOtherBuyLink if all validations pass' do
      release_type_other_buy_link = ReleaseTypeOtherBuyLink.new
      release_type_other_buy_link.release_type = @release_type
      release_type_other_buy_link.title = 'Interpunk.com'
      release_type_other_buy_link.buy_url = 'http://interpunk.com/item.cfm?Item=208203'
      release_type_other_buy_link.save

      expect(ReleaseTypeOtherBuyLink.count).to eq(1)
    end
  end
end
