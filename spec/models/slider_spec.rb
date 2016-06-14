require 'rails_helper'

RSpec.describe Slider, type: :model do
  context 'on saving' do
    it 'should save Slider if all validations pass' do
      slider = Slider.new
      slider.image = File.new("#{Rails.root}/app/assets/images/artists/analena_01.jpg")
      slider.url = 'https://www.facebook.com/moonleerecords/'

      expect(slider.valid?).to eq(true)
    end
  end
end
