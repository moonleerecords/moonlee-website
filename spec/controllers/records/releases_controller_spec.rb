require 'rails_helper'

RSpec.describe Records::ReleasesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before do
      release = Release.new
      release.title = 'Dobrodošli na okean'
      release.catalog_number = 'HMRL028'
      release.release_date = Date.new(2012, 11, 29)
      release.save
    end

    it 'returns http success' do
      get :show, params: { id: 'dobrodosli-na-okean' }
      expect(response).to have_http_status(:success)
    end
  end
end
