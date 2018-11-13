class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or tests_path
    else
      store_location
      flash.now[:alert] = 'Are you a Guru? Try to login again?'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end

  private

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
