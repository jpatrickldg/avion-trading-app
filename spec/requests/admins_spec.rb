require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /admin" do
    before do
      sign_in User.first
    end

    it 'returns the admin dashboard page' do
      get admin_dashboard_path
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH #update" do
    before do
      sign_in User.first
    end

    let(:user) { User.last }

    it 'activates the user' do
      user_params = {
        is_active: true
      }
      patch admin_update_user_path(user), params: { user: user_params }
      
      expect(response).to redirect_to '/admin'
      expect(flash[:notice]).to match('User Activated')
    end

    it 'updates the user' do
      user_params = {
        first_name: 'Bla bla',
        last_name: 'Bla bla'
      }
      patch admin_update_user_path(user), params: { user: user_params }
      
      expect(response).to redirect_to '/admin'
      expect(flash[:notice]).to match('User Updated')
    end

  end

  describe "POST #create" do
    before do
      sign_in User.first
    end

    it 'creates new user' do
      user_params = {
        first_name: 'test',
        last_name: 'test',
        email: 'random@test.com',
        password: '123456',
        password_confirmation: '123456',
        confirmed_at: Time.now
      }

      post admin_create_user_path, params: { user: user_params }
      expect(response).to redirect_to '/admin'
      expect(flash[:notice]).to match('User Created')
    end
  end
end
