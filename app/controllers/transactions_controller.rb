class TransactionsController < ApplicationController
  before_action :get_stock
  before_action :set_transaction, only: [:sell, :update_transaction]
  before_action :get_user
  before_action :check_authorization
  before_action :authenticate_user!

  def stock_transactions
    @transactions = @stock.transactions.where(user_id: @user.id, is_active: true)
    @stocks = Stock.all
    @client = IEX::Api::Client.new
  end

  def buy
    @transaction = @stock.transactions.build
  end

  def sell
  end

  def create_stock_transaction
    @transaction = @stock.transactions.build(transaction_params)
    @transaction.user_id = current_user.id
    
    if @transaction.save!
      redirect_to trader_transactions_path, notice: "Buy Transaction Successful"
    else
      render :buy
    end
  end

  def update_transaction
    old_price = @transaction.price
    old_amount = @transaction.amount
    if @transaction.update(is_active_params)
      @transaction.add_sell_transaction(old_price, old_amount)
      redirect_to trader_transactions_path, notice: "Sell Transaction Successful"
    else
      render :sell
    end
  end

  def destroy 
  end

  def get_stock
    @stock = Stock.find(params[:stock_id])
  end

  def set_transaction
    @transaction = @stock.transactions.find(params[:id])
  end

  def get_user
    @user = current_user
  end

  def check_authorization
    if current_user.role == 'admin'
      redirect_to admin_dashboard_path, notice: 'Access Denied'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:stock_id, :user_id, :price, :quantity, :amount, :transaction_type, :is_active)
  end

  def is_active_params
    params.require(:transaction).permit(:is_active, :price, :amount)
  end
  
end
