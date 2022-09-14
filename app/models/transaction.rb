class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  # after_commit :add_sell_transaction, on: :update
  before_create :set_amount, unless: Proc.new { self.transaction_type == "Sell" }

  validates :quantity, presence: true
  validates :is_active, inclusion: [true, false]
  validates :transaction_type, presence: true
  validates :price, presence: true
  validates :amount, presence: true

  def set_amount
    self.amount = self.price.to_f * self.quantity.to_f
  end

  def add_sell_transaction(price, amount)
    trans = Transaction.new
    trans.user_id = self.user_id 
    trans.stock_id = self.stock_id
    trans.quantity = self.quantity 
    trans.price = self.price
    trans.amount = self.amount
    trans.transaction_type = "Sell"
    trans.is_active = false
    trans.save

    self.update price: price
    self.update amount: amount
  end

end
