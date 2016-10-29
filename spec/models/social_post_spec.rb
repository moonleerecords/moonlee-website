require 'rails_helper'

RSpec.describe SocialPost, type: :model do
  context 'on saving' do
    it 'should save SocialPost if all validations pass' do
      social_post = SocialPost.new
      social_post.source = SocialPost::SOURCE_INSTAGRAM
      social_post.url = 'https://instagram.flju1-1.fna.fbcdn.net/t51.2885-15/s320x320/e35/14659235_183405935400735_5440615191886692352_n.jpg?ig_cache_key=MTM1NzI3MzA5OTI2NzE5NjMzOA%3D%3D.2'
      social_post.external_id = '1357273099267196338_241028993'

      expect(social_post.valid?).to eq(true)
    end
  end
end
