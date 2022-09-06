class PagesController < ApplicationController
  before_action :get_user_and_users
  before_action :authenticate_user!, except: [:home]
  before_action :set_stocks_and_transactions, only: [:portfolio]

  def home
  end

  def admin_home
    @users = User.where(role: 'trader')
  end

  def new_user
    @new_user = User.new
  end

  def create_user
    @new_user = User.new(user_params)

    if @new_user.save
      redirect_to admin_home_path
    else
      render :new_user
    end
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_home_path
    else
      redirect_to admin_edit_user_path(params[:id])
    end 
  end

  def portfolio
    require 'iex-ruby-client'
    @unique = @transactions.select('stock_id as stock_id, sum(quantity) as total_quantity').group(:stock_id)

    @client = IEX::Api::Client.new
    @client_list = @client.stock_market_list(:mostactive)
  end

  def transactions
    @transactions = @user.transactions.order(:created_at).reverse_order
    @stocks = Stock.all
  end

  def set_stocks_and_transactions
    @transactions = @user.transactions
    @stocks = Stock.all
  end

  def get_user_and_users
    @user = current_user
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role )
  end

end
