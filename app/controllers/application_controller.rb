class ApplicationController < ActionController::Base

  private

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    if !logged_in?
      redirect_to login_path
    end
  end
end
