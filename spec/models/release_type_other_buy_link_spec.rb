require 'rails_helper'

RSpec.describe ReleaseTypeOtherBuyLink, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
    it 'should save ReleaseTypeOtherBuyLink if all validations pass' do
      release_type_main_buy_link = ReleaseTypeOtherBuyLink.new
      release_type_main_buy_link.release_type = @release_type
      release_type_main_buy_link.buy_url = ''
      release_type_main_buy_link.save

      expect(ReleaseTypeOtherBuyLink.count).to eq(1)
    end
  end
end
