class PagesController < ApplicationController

  def home
    if current_user.present?
      if current_user.role == 'admin'
        redirect_to admin_dashboard_path
        return
      else
        redirect_to trader_dashboard_path
      end
    end
  end

end
