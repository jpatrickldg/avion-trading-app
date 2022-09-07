class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  after_create :set_is_active

  def set_is_active
    if self.transaction_type == 'Sell'
      trans = Transaction.where(amount: self.amount, transaction_type: 'Buy', quantity: self.quantity, is_active: true)
      trans.update is_active: false

    end
  end

end
