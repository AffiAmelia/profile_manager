require 'rails_helper'

RSpec.describe User, type: :model do
  user = described_class.new(email: 'kb@gmail.com', password: '123456')

  context 'when validation test' do
    it 'ensures email presence' do
      user.email = ''
      expect(user.valid?).to eq(false)
    end
  end
end
