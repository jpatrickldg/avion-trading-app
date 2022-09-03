class RemoveTransactionsIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index "transactions", [:user_id, :stock_id], unique: true
  end
end
