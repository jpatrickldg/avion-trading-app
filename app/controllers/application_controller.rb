class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
      current_user.role == 'admin' ? admin_home_path : root_path
  end
end
