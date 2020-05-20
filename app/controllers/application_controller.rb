class ApplicationController < ActionController::Base


  def require_login
    if session[:user_id].nil?
      flash[:error] = "You must login to do that"
      redirect_back(fallback_location: root_path)
    end
  end


end
