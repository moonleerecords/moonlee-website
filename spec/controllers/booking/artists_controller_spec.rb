require 'rails_helper'

RSpec.describe Booking::ArtistsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end
  end
end
