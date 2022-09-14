require 'rails_helper'

RSpec.describe "Traders", type: :request do
  describe "GET /trader" do
    before do
      sign_in create(:user)
    end

    it 'returns the trader dashboard' do
      get trader_dashboard_path
      expect(response).to have_http_status(200)
    end

    it 'returns the trader transactions' do
      get trader_transactions_path
      expect(response).to have_http_status(200)
    end

    it 'returns the trader portfolio' do
      get trader_portfolio_path
      expect(response).to have_http_status(200)
    end

  end
end
