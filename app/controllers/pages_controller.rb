class PagesController < ApplicationController
  before_action :get_user

  def home
    @users = User.all
  end

  def portfolio
  end

  def transactions
      @transactions = @user.transactions
      @stock = Stock.all
  end

  def get_user
    @user = current_user
  end

end
