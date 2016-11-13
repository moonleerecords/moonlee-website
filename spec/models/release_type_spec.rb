require 'rails_helper'

RSpec.describe ReleaseType, type: :model do
  before(:context) do
    @release = Release.new
    @release.title = 'Dobrodošli na okean'
    @release.catalog_number = 'HMRL028'
    @release.release_date = Date.new(2012, 11, 29)
    @release.save
  end

  context 'on saving' do
    it 'should save ReleaseType if all validations pass' do
      release_type = ReleaseType.new
      release_type.release = @release
      release_type.release_format = 'digital'

      expect(release_type.valid?).to eq(true)
    end
  end
end
