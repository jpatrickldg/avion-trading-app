require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'trial@test.com', password: '123456') }
  
  context 'Before registration' do

    it 'will not register user with empty first name' do
      user.last_name = 'TEST'
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'will not register user with empty last name' do
      user.last_name = nil
      user.first_name = 'TEST'
      expect(user).to_not be_valid
    end

    it 'will set is_active to false' do
      expect(user.is_active).to eq false
    end

    it 'will set role to trader' do
      expect(user.role).to eq 'trader'
    end

  end

end
