require 'rails_helper'

RSpec.describe Records::PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before do
      post = Post.new
      post.title = 'Politika – a new album by Bernays Propaganda'
      post.body = 'Macedonian activist musicians Bernays Propaganda have released their fourth album “Politika” today, March 14th 2016. Their new album, which sets an important milestone in band’s career, is released on the Slovenian independent label Moonlee Records available in the CD and LP formats, as well as a free download.'
      post.categories << 'news'
      post.visibility = 'public'
      post.published_at = Time.zone.local(2016, 03, 14, 11, 34, 00)
      post.save
    end

    it 'returns http success' do
      get :show, params: { id: '2016-03-14-politika-a-new-album-by-bernays-propaganda' }
      expect(response).to have_http_status(:success)
    end
  end
end
