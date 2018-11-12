class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def authenticate_user!
    unless current_user
      return redirect_to login_path, alert: 'Are you a guru? Try to log in again'
    end
    cookies[:email] = current_user.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
