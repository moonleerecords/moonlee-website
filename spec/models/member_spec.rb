require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'on saving' do
    it 'should save Member if all validations pass' do
      member = Member.new
      member.name = 'Boris Vlastelica'
      member.save

      expect(Member.count).to eq(1)
    end
  end
end
