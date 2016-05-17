require 'rails_helper'

RSpec.describe Release, type: :model do
  context 'on saving' do
    it 'should save Release if all validations pass' do
      release = Release.new
      release.title = 'Dobrodošli na okean'
      release.catalog_number = 'HMRL028'
      release.release_date = Date.new(2012, 11, 29)

      expect(release.valid?).to eq(true)
    end
  end
end
