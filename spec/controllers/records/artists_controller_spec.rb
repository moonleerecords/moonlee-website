require 'rails_helper'

RSpec.describe Records::ArtistsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before do
      artist = Artist.new
      artist.name = 'Repetitor'
      artist.save
    end

    it 'returns http success' do
      get :show, params: { id: 'repetitor' }
      expect(response).to have_http_status(:success)
    end
  end
end
