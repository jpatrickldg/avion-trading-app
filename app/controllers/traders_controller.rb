class TradersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_all_tables, :get_user_and_users, :get_current_user_transactions, :set_api
  layout "trader"
  
  def dashboard
    if params[:q].present?
      @quote = @client.quote(params[:q])
    end
  end

  def portfolio
    @active = @transactions.where(is_active: true)
    @unique = @active.select('stock_id as stock_id, sum(quantity) as total_quantity').group(:stock_id)
  end

  def transactions
    @transactions = @user.transactions.order(:created_at).reverse_order
  end

  def get_current_user_transactions
    @transactions = @user.transactions
  end

  def get_user_and_users
    @user = current_user
    @users = User.all
  end

  def get_all_tables
    @users = User.all 
    @stocks = Stock.all 
    @transactions = Transaction.all
  end

  def set_api
    require 'iex-ruby-client'
    @client = IEX::Api::Client.new
    @client_list = @client.stock_market_list(:mostactive)
  end
end
