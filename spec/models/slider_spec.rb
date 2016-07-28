require 'rails_helper'

RSpec.describe Slide, type: :model do
  context 'on saving' do
    it 'should save Slide if all validations pass' do
      slide = Slide.new
      slide.image = File.new("#{Rails.root}/app/assets/images/base/artists/analena_01.jpg")
      slide.url = 'https://www.facebook.com/moonleerecords/'

      expect(slide.valid?).to eq(true)
    end
  end
end
