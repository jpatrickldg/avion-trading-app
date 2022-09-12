class AdminsController < ApplicationController
  before_action :authenticate_user!, :get_user_and_users, :get_all_tables, :check_authorization
 
  def dashboard
    @users = User.where(role: 'trader')
    @inactive_users = @users.where(is_active: false)
    @active_users = @users.where(is_active: true)
    @stocks = Stock.all
  end

  def show_user
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
      redirect_to admin_dashboard_path, notice: 'User Created'
    else
      render :new_user
    end
  end

  def edit_user
    @user = User.find(params[:id])    
  end

  def activate_user
    @user = User.find(params[:id])   
  end

  def update_user
    @user = User.find(params[:id])
    old_user_status = @user.is_active
    if @user.update(user_params)
      if @user.is_active != old_user_status && @user.is_active == true
        ActivateUserMailer.with(user: @user).activate.deliver_now
        redirect_to admin_dashboard_path, notice: 'User Activated'
        return
      end
      redirect_to admin_dashboard_path, notice: 'User Updated'
    else
      redirect_to admin_edit_user_path(params[:id])
    end 
  end

  def transactions
    @transactions = Transaction.all.order(:created_at).reverse_order
    @stocks = Stock.all    
  end

  def get_all_tables
    @users = User.all 
    @stocks = Stock.all 
    @transactions = Transaction.all
  end

  def get_user_and_users
    @user = current_user
    @users = User.all
  end

  def check_authorization
    if current_user.role == 'trader'
      redirect_to trader_dashboard_path, notice: 'Access Denied'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :is_active )
  end

end
