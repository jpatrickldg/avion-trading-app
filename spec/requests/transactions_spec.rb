require 'rails_helper'

RSpec.describe "Transactions", type: :request do

  let (:stock) { Stock.create(name: 'Test', symbol: 'TST') }

  describe "GET /index" do
    before do
      sign_in create(:user)
    end
  
    it 'returns the current user transactions for the stock' do
      get stock_transactions_path(stock)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    before do
      sign_in create(:user)
    end

    it 'creates new transaction' do
      transaction_params = {
        stock_id: stock.id,
        transaction_type: 'Buy',
        price: 10.0,
        quantity: 10.0,
        amount: 100.0,
        is_active: true
      }

      post create_stock_transactions_path(stock), params: { transaction: transaction_params }
      expect(response).to redirect_to '/transactions'
      expect(flash[:notice]).to match('Buy Transaction Successful')
    end
  end

  describe "PATCH #update" do
    before do
      sign_in create(:user)
    end

    let (:transaction) { stock.transactions.create!(
      user_id: User.last.id,
      transaction_type: 'Buy',
      price: 10.0,
      quantity: 10.0,
      amount: 100.0,
      is_active: true
    ) }

    it 'updates the transaction is_active to false' do
      transaction_params = {
        is_active: false
      }
      patch update_stock_transaction_path(stock, transaction), params: { transaction: transaction_params }
      
      expect(response).to redirect_to '/transactions'
      expect(flash[:notice]).to match('Sell Transaction Successful')
    end
  end

end
