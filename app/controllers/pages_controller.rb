class PagesController < ApplicationController
  before_action :get_user_and_users
  before_action :authenticate_user!, except: [:home]
  before_action :set_stocks_and_transactions, only: [:portfolio]
  before_action :get_all_tables, only: [:admin_show_user]

  def home
  end

  def admin_home
    @users = User.where(role: 'trader')
    @inactive_users = @users.where(is_active: false)
    @active_users = @users.where(is_active: true)
    @stocks = Stock.all
  end

  def admin_show_user
    @user = User.find(params[:id])
    @active = @transactions.where(is_active: true, user_id: @user.id)
    @unique = @active.select('stock_id as stock_id, sum(quantity) as total_quantity').group(:stock_id)
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

  def update_user
    @user = User.find(params[:id])
    old_user_status = @user.is_active
    if @user.update(user_params)
      if @user.is_active != old_user_status && @user.is_active == true
        ActivateUserMailer.with(user: @user).activate.deliver_now
      end

      redirect_to admin_home_path
    else
      redirect_to admin_edit_user_path(params[:id])
    end 
  end

  def activate_user
    @user = User.find(params[:id])
  end

  def portfolio
    require 'iex-ruby-client'
    @active = @transactions.where(is_active: true)
    @unique = @active.select('stock_id as stock_id, sum(quantity) as total_quantity').group(:stock_id)

    @client = IEX::Api::Client.new
    @client_list = @client.stock_market_list(:mostactive)
  end

  def transactions
    @transactions = @user.transactions.order(:created_at).reverse_order
    @stocks = Stock.all
  end

  def admin_transactions
    @transactions = Transaction.all.order(:created_at).reverse_order
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

  def get_all_tables
    @users = User.all 
    @stocks = Stock.all 
    @transactions = Transaction.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :is_active )
  end

end
