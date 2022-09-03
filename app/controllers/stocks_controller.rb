class StocksController < ApplicationController
  before_action :authenticate_user!

  def index
    @stocks = Stock.all
  end

  def show
    require 'iex-ruby-client'
    @stock = Stock.find(params[:id])

    @client = IEX::Api::Client.new(
      publishable_token: 'pk_b51bcad458d549c68be92ebc5cb43be4',
      secret_token: 'sk_ec3e99fa21634d04aa7b8b7f70ad2a8c',
      endpoint: 'https://cloud.iexapis.com/v1')
    @client_list = @client.stock_market_list(:mostactive)
    @quote = @client.quote(@stock.symbol)

  end
end
