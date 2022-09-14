require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /home" do
    let (:trader) { create(:user) }
    let (:admin) { User.first }

    it 'returns trader dashboard' do
      sign_in trader
      get root_path
      expect(response).to redirect_to '/trader'
    end

    it 'returns trader dashboard' do
      sign_in admin
      get root_path
      expect(response).to redirect_to '/admin'
    end

  end
end
