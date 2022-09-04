class PagesController < ApplicationController
  before_action :get_user
  before_action :authenticate_user!, except: [:home]
  before_action :set_stocks_and_transactions, only: [:portfolio, :transactions]

  def home
    @users = User.all
  end

  def portfolio
    require 'iex-ruby-client'
    @unique = @transactions.select('stock_id as stock_id, sum(quantity) as total_quantity').group(:stock_id)

    @client = IEX::Api::Client.new(
      publishable_token: 'pk_b51bcad458d549c68be92ebc5cb43be4',
      secret_token: 'sk_ec3e99fa21634d04aa7b8b7f70ad2a8c',
      endpoint: 'https://cloud.iexapis.com/v1')
    @client_list = @client.stock_market_list(:mostactive)
  end

  def transactions
    
  end

  def set_stocks_and_transactions
    @transactions = @user.transactions
    @stocks = Stock.all
  end

  def get_user
    @user = current_user
  end

end
