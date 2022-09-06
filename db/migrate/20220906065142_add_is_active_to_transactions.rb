class AddIsActiveToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :is_active, :boolean, :default => true
  end
end
