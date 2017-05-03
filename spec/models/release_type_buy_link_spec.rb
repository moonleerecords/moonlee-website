require 'rails_helper'

RSpec.describe ReleaseTypeBuyLink, type: :model do
  before(:context) do
    @release = Release.new
    @release.title = 'Dobrodošli na okean'
    @release.catalog_number = 'HMRL028'
    @release.release_date = Date.new(2012, 11, 29)
    @release.save

    @release_type = ReleaseType.new
    @release_type.release = @release
    @release_type.release_format = 'cd'
    @release_type.save

    puts @release_type.errors.inspect

    puts ReleaseType.allowed_formats
  end

  context 'on saving' do
    it 'should save ReleaseTypeBuyLink if all validations pass' do
      release_type_buy_link = ReleaseTypeBuyLink.new
      release_type_buy_link.release_type = @release_type
      release_type_buy_link.title = 'Interpunk.com'
      release_type_buy_link.source = 'external'
      release_type_buy_link.buy_url = 'http://interpunk.com/item.cfm?Item=208203'

      expect(Release.count).to eq(1)
      expect(ReleaseType.count).to eq(1)
      expect(release_type_buy_link.valid?).to eq(true)
    end
  end
end
