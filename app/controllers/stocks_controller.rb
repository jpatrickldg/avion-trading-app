class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api, :get_user

  def index
    @stocks = Stock.all
    if params[:q].present?
      @quote = @client.quote(params[:q])
    end
  end

  def show
    @stock = Stock.find(params[:id])
    @quote = @client.quote(@stock.symbol)
  end

  def set_api
    require 'iex-ruby-client'
    @client = IEX::Api::Client.new
    @client_list = @client.stock_market_list(:mostactive)
  end

  def get_user
    @user = current_user
  end
end
