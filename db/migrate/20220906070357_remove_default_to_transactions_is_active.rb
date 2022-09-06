class RemoveDefaultToTransactionsIsActive < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:transactions, :is_active, nil)
  end
end
