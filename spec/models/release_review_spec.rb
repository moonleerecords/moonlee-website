require 'rails_helper'

RSpec.describe ReleaseReview, type: :model do
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
    it 'should save ReleaseReview if all validations pass' do
      release_review = ReleaseReview.new
      release_review.release = @release
      release_review.title = 'Some Will Never Know'
      release_review.url = 'http://www.swnk.org/reviews/repetitor-dobrodosli-na-okean/'
      release_review.save

      expect(ReleaseReview.count).to eq(1)
    end
  end
end
