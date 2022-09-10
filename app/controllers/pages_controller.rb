class PagesController < ApplicationController

  def home
    if current_user.present?
      if current_user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to trader_dashboard_path
      end
    end
  end

end
