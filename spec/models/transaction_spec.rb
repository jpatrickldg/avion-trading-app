require 'rails_helper'

RSpec.describe Transaction, type: :model do
  current_user = User.last

  let (:stock) { Stock.create(name: 'Test', symbol: 'TST') }

  let (:transaction) { stock.transactions.new(user_id: current_user.id, transaction_type: 'Buy', price: 15.0, quantity: 3.0, amount: 45.0, is_active: true) }

  context 'Before posting transaction' do
    it 'should compute the proper amount' do
      expect(transaction.set_amount).to eq transaction.amount
    end

    it 'will not accept empty quantity' do
      transaction.quantity = nil
      expect(transaction).to_not be_valid
    end

    it 'will not accept empty is_active' do
      transaction.is_active = nil
      expect(transaction).to_not be_valid
    end

    it 'will not accept empty transaciton_type' do
      transaction.transaction_type = nil
      expect(transaction).to_not be_valid
    end

    it 'will not accept empty price' do
      transaction.price = nil
      expect(transaction).to_not be_valid
    end

    it 'will not accept empty amount' do
      transaction.amount = nil
      expect(transaction).to_not be_valid
    end

    it 'will not accept empty user' do
      transaction.user_id = nil
      expect(transaction).to_not be_valid
    end

  end

  context 'After doing sell transaction' do
    it 'should add sell transaction' do
      transaction.is_active = false
      transaction.save!
      before_count = Transaction.count 
      transaction.add_sell_transaction(1.0, 1.0)
      expect(Transaction.last.transaction_type).to eq 'Sell'
      expect(Transaction.count).to_not eq before_count
    end
  end

end
