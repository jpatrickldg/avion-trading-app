class TransactionsController < ApplicationController
  before_action :get_stock
  before_action :get_user

  def stock_transactions
    @transactions = @stock.transactions
  end

  def buy
    @transaction = @stock.transactions.build
  end

  def create
    @transaction = @stock.transactions.build(transaction_params)
    @transaction.user_id = current_user.id
    @transaction.transaction_type = "Buy"
    @transaction.amount = @transaction.price.to_f * @transaction.quantity.to_f
    if @transaction.save!
      redirect_to user_transactions_path
    else
      render :buy
    end
  end

  def get_stock
    @stock = Stock.find(params[:stock_id])
  end

  def get_user
    @user = current_user
  end

  private

  def transaction_params
    params.require(:transaction).permit(:stock_id, :user_id, :price, :quantity, :amount, :transaction_type)
  end
  
end
