require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'on saving' do
    it 'should save Post if all validations pass' do
      post = Post.new
      post.title = 'Politika – a new album by Bernays Propaganda'
      post.body = 'Macedonian activist musicians Bernays Propaganda have released their fourth album “Politika” today, March 14th 2016. Their new album, which sets an important milestone in band’s career, is released on the Slovenian independent label Moonlee Records available in the CD and LP formats, as well as a free download.'
      post.categories << 'news'
      post.visibility = 'public'
      post.published_at = Time.zone.now

      expect(post.valid?).to eq(true)
    end
  end
end
